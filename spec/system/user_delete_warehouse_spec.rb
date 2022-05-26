require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    # Arrange
    w = Warehouse.create!(name: 'Cuiaba', code: 'CWB', city: 'Cuiabá', area: 10_000,
                          address: 'Av dos Jacarés, 1000', cep: '56000-000',
                          description: 'Galpão no centro do país')
    # Act
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Cuiaba'
    expect(page).not_to have_content 'CWB'
  end

  it 'e não apaga outros galpões' do
    # Arrange
    first_warehouse = Warehouse.create!(name: 'Cuiaba', code: 'CWB', city: 'Cuiabá', area: 10_000,
                                        address: 'Av dos Jacarés, 1000', cep: '56000-000',
                                        description: 'Galpão no centro do país')
    second_warehouse = Warehouse.create!(name: 'Curitiba', code: 'CRB', city: 'Curitiba', area: 20_000,
                                        address: 'Centro', cep: '80000-000',
                                        description: 'Galpão no sul do país')
    # Act
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).to have_content 'Curitiba'
    expect(page).not_to have_content 'Cuiaba'
  end
end