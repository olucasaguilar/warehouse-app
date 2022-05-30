require 'rails_helper'

describe 'Usuário cadastra um novo fornecedor' do
  it 'a partir da tela inicial' do
    # Arrange

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    # Assert
    expect(page).to have_content('Novo fornecedor')
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('E-mail')
    expect(page).to have_field('Telefone')
  end

  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Razão Social', with: 'Spark Industries LTDS'
    fill_in 'Nome Fantasia', with: 'Spark'
    fill_in 'CNPJ', with: '1425436954785'
    fill_in 'Endereço', with: 'Bairro Nova Aparecida, 130'
    fill_in 'Cidade', with: 'Piedade'
    fill_in 'Estado', with: 'SP'
    fill_in 'E-mail', with: 'spark@gmail.com'
    fill_in 'Telefone', with: '(45)12345-1542'
    click_on 'Enviar'
    # Assert
    expect(current_path).to eq suppliers_path
    expect(page).to have_content('Fornecedor cadastrado com sucesso.')
    expect(page).to have_content('Spark')
    expect(page).to have_content('Piedade - SP')
  end

  it 'com dados incompletos' do
    # Arrange

    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Razão Social', with: 'Spark Industries LTDS'
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Enviar'
    # Assert
    expect(page).to have_content 'Fornecedor não cadastrado.'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_field 'Razão Social', with: 'Spark Industries LTDS'
  end
end