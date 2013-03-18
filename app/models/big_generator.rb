class BigGenerator
  include Mongoid::Document

  field :model, type: String
  field :kva_max, type: Float
  field :kva_cont, type: Float
  field :kw_max, type: Float
  field :kw_cont, type: Float
  field :napon, type: String
  field :struja, type: Integer
  field :frekvencija, type: Integer
  field :autonomija, type: Float
  field :motor_proizvodjac, type: String
  field :motor_model, type: String
  field :motor_poreklo, type: String
  field :motor_gorivo, type: String
  field :motor_rpm, type: Integer
  field :motor_cm3, type: Integer
  field :motor_aspiracija, type: String
  field :motor_cilindri, type: Integer
  field :motor_regulacija, type: String
  field :motor_ulje, type: Float
  field :motor_hladjenje, type: String
  field :motor_antifriz, type: Float
  field :motor_potrosnja_75, type: Float
  field :motor_rezervoar, type: Integer
  field :generator_proizvodjac, type: String
  field :generator_model, type: String
  field :generator_poreklo, type: String
  field :generator_polovi, type: Integer
  field :generator_napon, type: String
  field :generator_frekvencija, type: Integer
  field :generator_regulacija_napona, type: String
  field :generator_tacnost_regulacije, type: String
  field :generator_stepen_zastite, type: String
  field :generator_izolacija, type: String
  field :nivo_buke_otvoreni, type: Integer
  field :nivo_buke_canopy, type: Integer
  field :dimenzije_otvoreni, type: String
  field :masa_otvoreni, type: Integer
  field :dimenzije_canopy, type: String
  field :masa_canopy, type: Integer
  field :kontrolna_tabla_ats, type: String

  # Default scope
  default_scope order_by(kva_max: "asc")
end
