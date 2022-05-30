require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when corporate name is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: '', brand_name: 'ACME', registration_number: 1259647851236,
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'false when brand_name is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: '', registration_number: 1259647851236,
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'false when registration number is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '',
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'false when email is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259647851236',
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: '',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'true when full address is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259647851236',
                                full_address: '', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq true
      end
      
      it 'true when city is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259647851236',
                                full_address: 'Av das Palmas, 100', city: '', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq true
      end
      
      it 'true when state is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259647851236',
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: '', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq true
      end
      
      it 'true when state is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259647851236',
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'PR', email: 'acme@gmail.com',
                                phone_number: '')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq true
      end
    end

    it 'false when registration number is already in use' do
      # Arrange
      first_supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 1259647851236,
                                        full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                        phone_number: '(45)12345-1234')

      second_supplier = Supplier.new(corporate_name: 'Spark Industries LTDS', brand_name: 'Spark', registration_number: '1259647851236',
                                    full_address: 'Bairro Nova Aparecida', city: 'Piedade', state: 'PR', email: 'spark@gmail.com', 
                                    phone_number: '(45)12345-1234')
      # Act
      result = second_supplier.valid?

      # Assert
      expect(result).to eq false
    end

    context 'format' do
      it 'false when registration number is not with 13 characters' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: 12597851236,
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'true when registration number is with 13 characters' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '1259785123657',
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq true
      end
      
      it 'false when registration number is not only integers' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12sa785123657',
                                full_address: 'Av das Palmas, 100', city: 'Bauru', state: 'SP', email: 'acme@gmail.com',
                                phone_number: '(45)12345-1234')
        # Act
        result = supplier.valid?
        # Assert
        expect(result).to eq false
      end
    end
  end
end
