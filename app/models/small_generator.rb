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

  # Validations
  validates_presence_of :model, :kva_max, :kva_cont, :kw_max, :kw_cont,
                        :start, :motor_proizvodjac, :motor_tip, :motor_rpm,
                        :motor_cilindri, :motor_gorivo, :motor_hladjenje,
                        :generator_proizvodjac, :napon, :frekvencija, :panel

  validates :kva_max,             numericality: { greater_than: 0 }
  validates :kva_cont,            numericality: { greater_than: 0 }
  validates :kw_max,              numericality: { greater_than: 0 }
  validates :kw_cont,             numericality: { greater_than: 0 }
  validates :start,               format: { with: /^[R|A]$/ }
  validates :dimenzije,           format: { with: /^\d+x\d+x\d+$/ }, allow_blank: true
  validates :masa,                numericality: { greater_than: 0 }
  validates :motor_hp,            numericality: { greater_than: 0 }, allow_blank: true
  validates :motor_rpm,           numericality: { greater_than: 0 }
  validates :motor_cilindri,      numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 4 }
  validates :motor_cm3,           numericality: { greater_than: 0 }, allow_blank: true
  validates :motor_potrosnja_75,  numericality: { greater_than: 0 }, allow_blank: true
  validates :motor_rezervoar,     numericality: { greater_than: 0 }, allow_blank: true
  validates :autonomija,          numericality: { greater_than: 0 }, allow_blank: true
  validates :nivo_buke,           numericality: { greater_than: 0 }, allow_blank: true
  validates :frekvencija,         numericality: { greater_than: 0 }

  #default scope to sort by power
  default_scope order_by(kva_max: "asc")
end
