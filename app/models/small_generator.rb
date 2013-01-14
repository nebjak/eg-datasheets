class SmallGenerator
  include Mongoid::Document
  field :model, type: String
  field :kva_max, type: Float
  field :kva_cont, type: Float
  field :kw_max, type: Float
  field :kw_cont, type: Float
  field :start, type: String
  field :dimenzije, type: String
  field :masa, type: Integer
  field :motor_proizvodjac, type: String
  field :motor_tip, type: String
  field :motor_hp, type: Float
  field :motor_rpm, type: Integer
  field :motor_cilindri, type: Integer
  field :motor_cm3, type: Integer
  field :motor_gorivo, type: String
  field :motor_hladjenje, type: String
  field :motor_potrosnja_75, type: Float
  field :motor_rezervoar, type: Float
  field :autonomija, type: Float
  field :nivo_buke, type: Integer
  field :generator_proizvodjac, type: String
  field :generator_tip, type: String
  field :napon, type: String
  field :frekvencija, type: Integer
  field :panel, type: String
end
