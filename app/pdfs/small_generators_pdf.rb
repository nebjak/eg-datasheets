# encoding: utf-8
class SmallGeneratorsPdf < Prawn::Document
  def initialize(generator, view)
    super(
      page_size: "A4",
      info: {
        Title: generator.model,
        Subject: "Elektro agregat Energoglobal #{generator.model}",
        Author: "Energoglobal doo",
        Creator: "Energoglobal doo",
        CreationDate: Time.now,
        ModDate: Time.now
      }
    )
    @generator = generator
    @view = view
    image "#{Rails.root}/app/assets/images/logo.png", width: 523
    move_down 20
    font_style("Arial_Black")
    text @generator.model, size: 36
    move_down 15
    font_style("Arial")
    table generator_specs_table do
      self.width = 520
      self.column_widths=130
      #self.row_colors = ["#FFFFFF", "#DDDDDD"]
      columns(1).align = :right
      columns(3).align = :right
    end
    move_down 15
    font_style("Arial_Bold")
    text "Motor", size: 24
    font_style("Arial")
    table engine_spec_table do
      self.width = 520
      self.column_widths=130
      columns(1).align = :right
      columns(3).align = :right
    end
    move_down 15
    font_style("Arial_Bold")
    text "Generator", size: 24
    font_style("Arial")
    table alternator_spec_table do
      self.width = 520
      self.column_widths=130
      columns(1).align = :right
      columns(3).align = :right
    end
  end

  def generator_specs_table
    [
      ["Stand by snaga", "#{nice_num @generator.kva_max} kVA", "Prime snaga", "#{nice_num @generator.kva_cont} kVA"],
      ["Stand by snaga", "#{nice_num @generator.kw_max} kW", "Prime snaga", "#{nice_num @generator.kw_cont} kW"],
      ["Napon", "#{@generator.napon} V", "Frekvencija", "#{@generator.frekvencija} Hz"],
      ["Start", "#{@generator.start == "E" ? "elektro start" : "ručni start"}", "Nivo buke", "#{@generator.nivo_buke} dB"],
      ["Dimenzije", "#{@generator.dimenzije} mm", "Masa", "#{@generator.masa} kg"],
      ["Autonomija", "#{nice_num @generator.autonomija} h", "Tip panela", "#{@generator.panel}"]
    ]
  end

  def engine_spec_table
    [
      ["Proizvođač", "#{@generator.motor_proizvodjac}", "Tip motora", "#{@generator.motor_tip}"],
      ["Pogonsko gorivo", "#{@generator.motor_gorivo}", "Vrsta hlađenja", "#{@generator.motor_hladjenje}"],
      ["Snaga motora", "#{nice_num @generator.motor_hp} hp", "Zapremina motora", "#{@generator.motor_cm3} cm3"],
      ["Broj obrtaja", "#{@generator.motor_rpm} rpm", "Broj cilindara", "#{@generator.motor_cilindri}"],
      ["Zapremina rezervoara", "#{nice_num @generator.motor_rezervoar} l", "Potrošnja (75%)", "#{nice_num @generator.motor_potrosnja_75} l/h"]
    ]
  end

  def alternator_spec_table
    [
      ["Proizvođač", "#{@generator.generator_proizvodjac}", "Tip generatora", "#{@generator.generator_tip}"]
    ]
  end
  
  def font_style(style)
    font "#{Rails.root}/app/fonts/#{style}.ttf"
  end

  def nice_num(num)
    @view.number_with_delimiter num, separator: ","
  end
end
