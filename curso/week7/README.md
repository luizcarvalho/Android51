= SENSORES

== Sensores
- Dispositivos do Hardwares que medem o ambiente físico, movimento, posição, embiente

== Alguns exemplos de sensores
- Movimento - Acelerometro (3 eixos)
- Posição - Campo Magnético (3 eixos)
- Ambiente - Pressão

== SensorManager
- Serviço do sistema que gerencia os sensores

=== Instancie com
  getSystemService(Context.SENSOR_SERVICE)

=== Acesse um sensor específico com
  SensorManager.getDefaultSensor(int type)

== Alguns tipos de constantes para Sensores
- Acelerometro- Sensor: Sensor.TYPE_ACCELEROMETER
- Campos Magnético - Sensor.TYPE_MAGNETIC_FIELD
- Pressure - Sensor.TYPE_PRESSURE

== SensorEventListner
- Interface para SensorEvent Callback

-- Chamado quando a precisão do sensor é alterada
  void onAccuracyChanged(Sensor sensor, int accuracy)

-- Chamado quando os valores do sensor são alterados
  void onSensorChanged(SensorEvent event)

== Registros para SensorEvents
- Use o SensorManager para registrar/desregistrar os SensorEvents

- Para registrar um SensorEventLisneter para um determinado sensor
  public boolean registerListener(SensorEventListener listener, Sensor sensor, int rate)

- Para desregistrar um listener  para sensores que foram registrados
  public void unregisterListener(SensorEventListener listener, Sensor sensor)

== SensorEvent
- Representa um evento de um sensor
- Dados são específicos de cada sensor
- Tipo do sensor
- Timestamp
- Pressão
- Dados mensuráveis

== Sistema de coordenadas do sensor
- Quando a orientação padrão é retrado e o dispositivo esta deitado com a face para cima, os eixos são
	X - direita para esquerda
	Y - Cima para baixo
	Z - Baixo para cima

- O Sistema de Coordenadas não muda quando a orientação do dispositivo muda
- Exibindo valores crus lidos do acelerômetro do dispositivo
  X:1.187827
  Y:9.5787383
  Z:-0.06789781

== Valores do Acelerometro
- Quando o dispositivo estiver em pé, o acelerometro irá imediatamente reportar
  X≃~ 0 m/s²
  X≃~ 9.81 m/s²
  X≃~ 0 m/s²
 - Mas os valores pode  variar por movimentos naturaus superficies irregulares, ruidos, etc..

 == Filtrando valores do acelerometro
 - Duas transformações comuns
 - Filtro low-pass
 - Filtro high-pass

 == Filtro low-pass
 - não prioriza as mudanças de forças transitórias e enfatizam as mudanças de forças constântes

== Filtro High-pass
- Priorizam mudanças de forças transitórias e não mudanças de forças contântes

== SensorCompass
- Usa o acelerometro do dispositivo e o magnetometro para orientar a  bússula



= Localização e mapas
- Localização
- Classe de suporte a localização
- Mapas
- Classe de suporte a Mapas


== Serviço de Localização
- Aplicações móveis podem se beneficiar das localidades consistentes
- Permite que aplicações determinem e manipulem as localizações

== Usando Informações da Localização
-  Encontre lojas próximas da localização atual do usuário
- Guie o usuário de uma loja atual para outra específica
- Definir uma área delimitada
- Iniciar uma ação quando um usuário entrar nessa área

== Localizações
- Represenam a posição na terra
- Uma instância de localização consiste em: 
- Latitude
- Longiture
- Altitude
- Velocidade
- Comportamento


== LocationProvides
- Representa uma origem dos dados de localização
atual, pode vir de:
- satélites GPS
- Torres de Celular
- pontos de acesso Wifi


== Tipos de LocationProvider
- Rede - Wifi e torres de celular
- GPS - Satélite
- Passivo - Pegar carona nas solicitações de outros aplicativos


== Provedores de Rede
- Determina a localização baseado em torres de celular e pontos WIFI
- Requer:
  
  android.permission.ACCESS_COARSE_LOCATION
  android.permission.ACCESS_FINE_LOCATION

== Provedor GPS
- Determina a localização usando satelites
- Requer:
  
  android.permission.ACCESS_FINE_LOCATION

== Provedor Passivo
- Retorna localizações geradas por outros provedores
- requer:

  android.permission.ACCESS_FINE_LOCATION

== LocationProvider
- Direferentes LocationProviders oferencem diferentes vantagens e desvantagens em relação ao custo, precisão, disponibilidade e tempestividade


== Vantagens e Desvantagens dos Providers
- GPS: Custo alto, Preciso, Devagar, disponível em lugares abertos
- Network - Mais barato, menos preciso, rápido, disponibilidade varia
- Passivo - Mais barato, rapido, nem sempre disponível

== LocationManager
- Serviço do sistema para acessar dados de localização
  
  getSystemService(Context.LOCATION_SERVICE)

- Determina a última localização conhecida do usuário para atualizações de localização
- Registra atualizaçṍes de localização
- registra para receber Intents quando o dispositivo estiver próximo ou se movimentar em uma determinada área geográfica

== LocationListener
- Define métodos callbacks que são chamandos quando a Localização ou o estado de um LocationProvider é alterado

  void onLocationChanged(Location location)
  void onProviderDisabled(String provider)
  void onProviderEnabled(String provider)
  void onStatusChanged(String provider, int status, Bundle extras)

== Obtendo Localizações
- Iniciar um listener para atualizações de um LocationProvider
- Manter um "Estimatíva ótima atual" da localização
- Quando uma estimatíva for "Boa o suficiente", pare o Listener para atualizações de localização
- Use a melhor Localização estimada

== Determinando a melhor Localização
- Diversos fatores para ser considerados
- Tempo de obtenção da informação
- Precisão
- Energia necessária

==[EX] LocationGetLocation
- Aplicação capitura e exibe a ultima lozalição conhecida para todos os provedores
- Se necessário, busca e exibe a leitura para todos os provedores

== Dicas para economizar a bateria
- Sempre verifique a última medição conhecida
- Retorne atualiações o menos frequente possível, limete o tempo de mensuração.
- Desligue os updates no onPause();

== Mapas
- Representação visual da área
- ANdroid provê suporte a mapas atavés do Google Maps ANdroid V2 API

== Tipos de Mapa
- Normal: Mapa tradicional com ruas
- Satélite: Photografia aérea
- Hybrido: Satelite + Mapa tradicional
- Terrreno: Detalhes topográficos

== Customizando Maps
- Mude a posição da camera
- Adiconar Marcadores e áreas sobrepostas
- Responda a gestos
- Indicar localização atual do usuário

== Algumas Classes de Mapa
- GoogleMap
- MapFragment
- Camera
- Marcador

== Configurando aplicações com mapas
- Configure Google Play Services SDK
- Optenha uma API Key
- Especifique as configurações da applicação no Manifest
- Adicione o mapa ao projeto

== Map Permissions
  <uses-permission android:name="android.permission.INTERNET"/>
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

  <uses-permissionandroid:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
  <uses-permissionandroid:name="com.google.android.providers.!gsf.permission.READ_GSERVICES"/>

  <uses-permissionandroid:name="android.permission.ACCESS_COARSE_LOCATION"/>
  <uses-permissionandroid:name="android.permission.ACCESS_FINE_LOCATION"/>

== [EX] MapEarthQuakeMap
- Esta aplicação capitura dados de terremotos de um servidor
- E exibe os dados no mapa usando Marcadores clicáveis








