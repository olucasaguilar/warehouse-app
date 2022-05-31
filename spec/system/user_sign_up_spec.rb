require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Jose'
    fill_in 'E-mail', with: 'jose@gmail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'
    
    # Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'jose@gmail.com'
    expect(page).to have_button 'Sair'
    user = User.last
    expect(user.name).to eq 'Jose'
  end
end