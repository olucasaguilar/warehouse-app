require 'rails_helper'

describe 'Usuário vê detalhes de um fornecedor' do
  it 'e ve informações adicionais' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 1259647851236,
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                    phone_number: '(45)12345-1234')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    # Assert
    expect(page).to have_content('ACME LTDA')
    expect(page).to have_content('ACME')
    expect(page).to have_content('1259647851236')
    expect(page).to have_content('Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('acme@gmail.com')
    expect(page).to have_content('(45)12345-1234')
  end

  it 'e volta para a tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 1259647851236,
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                    phone_number: '(45)12345-1234')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'
    # Assert
    expect(current_path).to eq(root_path)
  end
end