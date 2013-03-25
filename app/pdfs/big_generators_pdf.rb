# encoding: utf-8
class BigGeneratorsPdf < Prawn::Document
  def initialize(generator, view)
    super(
      page_size: "A4",
      info: {
        Title: generator.model,
        Subject: "Energoglobal #{generator.model}",
        Author: "Energoglobal doo",
        Creator: "Energoglobal doo",
        CreationDate: Time.now,
        ModDate: Time.now
      }
    )
    @generator = generator
    @view = view

    font_style("Arial_Black")
    fill_color 51, 16, 0, 45
    text "#{@generator.model}", size: 36
 
    fill_color 0, 0, 0, 100
    move_down 40
    font_style("Arial")
    table generator_specs_table do
      self.width = 520
      self.column_widths = 130
      columns(1).align = :right
      columns(3).align = :right
    end

    move_down 15
    font_style("Arial_Bold")
    text "Motor", size: 24

    font_style("Arial")
    table engine_spec_table do
      self.width = 520
      self.column_widths = 130
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

    # Footer
    image "#{Rails.root}/app/assets/images/footer.jpg", width: 523, at: [0, 24]
  end

  def generator_specs_table
    [
      ["Stand by snaga", "#{nice_num @generator.kva_max} kVA", "Prime snaga", "#{nice_num @generator.kva_cont} kVA"],
      ["Stand by snaga", "#{nice_num @generator.kw_max} kW", "Prime snaga", "#{nice_num @generator.kw_cont} kW"],
      ["Napon", "#{@generator.napon} V", "Struja", "#{@generator.struja} A"],
      ["Frekvencija", "#{@generator.frekvencija} Hz", "Autonomija", "#{nice_num @generator.autonomija} h"],
      ["Nivo buke otvoreni set", "#{@generator.nivo_buke_otvoreni} dBA", "Nivo buke canopy set", "#{nice_num @generator.nivo_buke_canopy} dBA"],
      ["Dimenzije otvoreni set", "#{@generator.dimenzije_otvoreni} mm", "Dimzenzije canopy set", "#{nice_num @generator.dimenzije_canopy} mm"],
      ["Masa otvoreni set", "#{@generator.masa_otvoreni} kg", "Masa canopy set", "#{nice_num @generator.masa_canopy} kg"],
      ["Kontrolna tabla/ATS", "#{@generator.kontrolna_tabla_ats}"]
    ]
  end

  def engine_spec_table
    [
      ["Proizvođač", "#{@generator.motor_proizvodjac}", "Model motora", "#{@generator.motor_model}"],
      ["Zemlja porekla", "#{@generator.motor_poreklo}", "Pogonsko gorivo", "#{@generator.motor_gorivo}"],
      ["Broj obrtaja", "#{@generator.motor_rpm} rpm", "Zapremina", "#{@generator.motor_cm3} cm3"],
      ["Aspiracija", "#{@generator.motor_aspiracija}", "Broj cilindara", "#{@generator.motor_cilindri}"],
      ["Regulacija", "#{@generator.motor_regulacija}", "Kapacitet ulja", "#{@generator.motor_ulje} l"],
      ["Vrsta hlađenja", "#{@generator.motor_hladjenje}", "Rashladna tečnost", "#{@generator.motor_antifriz} l"],
      ["Potrošnja (75%)", "#{nice_num @generator.motor_potrosnja_75} l/h", "Rezervoar", "#{@generator.motor_rezervoar} l"]
    ]
  end

  def alternator_spec_table
    [
      ["Proizvođač", "#{@generator.generator_proizvodjac}", "Model generatora", "#{@generator.generator_model}"],
      ["Zemlja porekla", "#{@generator.generator_poreklo}", "Broj polova", "#{@generator.generator_polovi}"],
      ["Napon", "#{@generator.generator_napon} V", "Frekvencija", "#{@generator.generator_frekvencija} Hz"],
      ["Regulacija napona", "#{@generator.generator_regulacija_napona}", "Tačnost regulacije", "#{@generator.generator_tacnost_regulacije}"],
      ["Stepen zaštite", "#{@generator.generator_stepen_zastite}", "Klasa izolacije", "#{@generator.generator_izolacija}"]
    ]
  end

  def font_style(style)
    font "#{Rails.root}/app/fonts/#{style}.ttf"
  end

  def nice_num(num)
    @view.number_with_delimiter num, separator: ","
  end
end
