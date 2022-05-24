require 'rails_helper'

describe 'Usuário edita um galpão' do
  it '' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    # Assert
    expect(page).to have_content('Editar Galpão')
    expect(page).to have_field('Nome', with: 'Aeroporto SP')
    expect(page).to have_field('Descrição', with: 'Galpão destinado para cargas internacionais')
    expect(page).to have_field('Código', with: 'GRU')
    expect(page).to have_field('Endereço', with: 'Avenida do Aeroporto, 1000')
    expect(page).to have_field('Cidade', with: 'Guarulhos')
    expect(page).to have_field('CEP', with: '15000-000')
  end

  it 'com sucesso' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: 'Galpão Novo'
    fill_in 'Área', with: '9999'
    fill_in 'Endereço', with: 'Endereço Novo'
    fill_in 'CEP', with: '99999-999'
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Galpão Atualizado com sucesso'
    expect(page).to have_content 'Nome: Galpão Novo'
    expect(page).to have_content 'Endereço: Endereço Novo'
    expect(page).to have_content 'Área: 9999 m²'
    expect(page).to have_content 'CEP: 99999-999'
  end

  it 'e mantém os campos obrigatórios' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')
    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: 'Aeroporto Novo'
    fill_in 'Área', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    # Assert
    expect(page).to have_content 'Não foi possivel atualizar o galpão.'
  end
end