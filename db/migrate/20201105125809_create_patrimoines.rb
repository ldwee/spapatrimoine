class CreatePatrimoines < ActiveRecord::Migration[6.0]
  def change
    create_table :patrimoines do |t|
      t.string :libelle
      t.text :illustration
      t.string :localisation
      t.string :inscription
      t.string :categorie
      t.string :notice 
      t.text :etat
      t.boolean :endangered

      t.timestamps
    end
  end
end
