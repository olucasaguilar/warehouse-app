require 'rails_helper'

describe 'Usuário cadastra um modelo de produto' do
  it 'com sucesso' do
    # Arrange
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                phone_number: '(45)12345-1234')
    other_supplier = Supplier.create!(corporate_name: 'LG do Brasil', brand_name: 'LG', 
                                registration_number: 6549873211596, full_address: 'Av do LG, 500', 
                                city: 'Bauru', state: 'SP', email: 'contato@lg.com', 
                                phone_number: '(55)65432-1452')
    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'Peso', with: '10_000'
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: 90
    fill_in 'Profundidade', with: 10
    fill_in 'SKU', with: 'TV4780-SA54MS-XPT75O'
    select 'LG', from: 'Fornecedor'
    click_on 'Enviar'
    # Assert
    expect(page).to have_content 'Modelo de produto cadastrado com sucesso'
    expect(page).to have_content 'TV 40 polegadas'
    expect(page).to have_content 'Fornecedor: LG'
    expect(page).to have_content 'TV4780-SA54MS-XPT75O'
    expect(page).to have_content 'Dimensão: 60cm x 90cm x 10cm'
    expect(page).to have_content '10000g'
  end

  it 'deve preencher todos os campos' do
    # Arrange
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                phone_number: '(45)12345-1234')
    # Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: ''
    fill_in 'SKU', with: ''
    click_on 'Enviar'
    # Assert
    expect(page).to have_content 'Não foi possível cadastrar o modelo de produto.'
  end
end