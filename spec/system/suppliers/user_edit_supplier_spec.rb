require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da tela inicial' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 1259647851236,
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                    phone_number: '(45)12345-1234')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    # Assert
    expect(page).to have_content('Editar Fornecedor')
    expect(page).to have_field('Razão Social', with: 'ACME LTDA')
    expect(page).to have_field('Nome Fantasia', with: 'ACME')
    expect(page).to have_field('CNPJ', with: '1259647851236')
    expect(page).to have_field('Endereço', with: 'Av das Palmas, 100')
    expect(page).to have_field('Cidade', with: 'Bauru')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('E-mail', with: 'acme@gmail.com')
    expect(page).to have_field('Telefone', with: '(45)12345-1234')
  end
  
  it 'com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 1259647851236,
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                    phone_number: '(45)12345-1234')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Razão Social', with: 'Johnsons John LTDA'
    fill_in 'Nome Fantasia', with: 'John'
    fill_in 'CNPJ', with: '7521436987416'
    fill_in 'Endereço', with: 'Rua Bla, 45'
    fill_in 'Cidade', with: 'Socorro'
    fill_in 'Estado', with: 'PI'
    fill_in 'E-mail', with: 'johnsons@gmail.com'
    fill_in 'Telefone', with: '(45)12245-8947'
    click_on 'Enviar'
    # Assert
    expect(page).to have_content('Fornecedor Atualizado com sucesso.')
    expect(page).to have_content('Johnsons John LTDA')
    expect(page).to have_content('John')
    expect(page).to have_content('7521436987416')
    expect(page).to have_content('Rua Bla, 45 - Socorro - PI')
    expect(page).to have_content('johnsons@gmail.com')
    expect(page).to have_content('(45)12245-8947')
  end

  it 'sem passar na validação' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 1259647851236,
                    full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                    phone_number: '(45)12345-1234')
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Razão Social', with: 'Johnsons John LTDA'
    fill_in 'Nome Fantasia', with: 'John'
    fill_in 'CNPJ', with: '752143698AAAA7416'
    fill_in 'Endereço', with: 'Rua Bla, 45'
    fill_in 'Cidade', with: 'Socorro'
    fill_in 'Estado', with: 'PI'
    click_on 'Enviar'
    # Assert
    expect(page).to have_content('Não foi possivel atualizar o fornecedor.')
    expect(page).to have_field('Razão Social', with: 'Johnsons John LTDA')
    expect(page).to have_field('Nome Fantasia', with: 'John')
    expect(page).to have_field('Endereço', with: 'Rua Bla, 45')
    expect(page).to have_field('Cidade', with: 'Socorro')
    expect(page).to have_field('Estado', with: 'PI')
  end
end