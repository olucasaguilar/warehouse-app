require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
  it 'a partir do menu' do
    # Arrange

    # Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    # Assert
    expect(current_path).to eq product_models_path 
  end

  it 'com sucesso' do
    # Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA',
                                registration_number: '1234567891234', full_address: 'Av Nacoes,1000',
                                city: 'São Paulo', state: 'SP', email: 'sac@samsung.com')
    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV7432-S4AMSU-XPTO90', supplier: supplier)
    ProductModel.create!(name: 'SoundBar 7.1 Surround', weight: 3000, width: 80, height: 15, 
                         depth: 20, sku: 'SOU751-SA8MSU-NOIZ77', supplier: supplier)
    # Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end
    # Assert
    expect(page).to have_content 'TV 32'
    expect(page).to have_content 'TV7432-S4AMSU-XPTO90'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'SoundBar 7.1 Surround'
    expect(page).to have_content 'TV 32'
    expect(page).to have_content 'SOU751-SA8MSU-NOIZ77'
  end

  it 'e não existem produtos cadastrados' do
    # Arrange

    # Act
    visit root_path
    click_on 'Modelos de Produtos'

    # Assert
    expect(page).to have_content 'Nenhum modelo de produto cadastrado.'
  end
end