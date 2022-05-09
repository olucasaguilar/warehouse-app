require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Sistema de Galpões e Estoque')
  end
end