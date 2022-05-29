require 'rails_helper'

describe 'Usuário visualiza fornecedores' do
  it 'a partir do menu' do
    # Arrange

    # Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    # Assert
    expect(page).to have_content('Fornecedores')
  end
  
  it 'com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259647851236',
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com')
    Supplier.create!(corporate_name: 'Spark Industries LTDS', brand_name: 'Spark', registration_number: '5436954785',
                    full_address: 'Bairro Nova Aparecida', city: 'Piedade', state: 'PR', email: 'spark@gmail.com')
    # Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    # Assert
    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('ACME')
    expect(page).to have_content('Bauru - SP')
    expect(page).to have_content('Spark')
    expect(page).to have_content('Piedade - PR')
  end
  
  it 'e não existem fornecedores cadastrados' do
    # Arrange

    # Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    # Assert
    expect(page).not_to have_content('Nome')
    expect(page).not_to have_content('Localização')
    expect(page).to have_content('Não existem fornecedores cadastrados.')
  end
end