require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'name is mandatory' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: '', weight: 3000, width: 80, height: 15, 
                              depth: 20, sku: 'SOU71-SAMSU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'sku is mandatory' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'Samsung', weight: 3000, width: 80, height: 15, 
                              depth: 20, sku: '', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'weight is mandatory' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'Samsung', weight: '', width: 80, height: 15, 
                              depth: 20, sku: 'SOU731-SA5MSU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'width is mandatory' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'Samsung', weight: 3000, width: '', height: 15, 
                              depth: 20, sku: 'SOU571-SAMS7U-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'height is mandatory' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'Samsung', weight: 3000, width: 80, height: '', 
                              depth: 20, sku: 'SO7U71-SAMS4U-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'depth is mandatory' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'Samsung', weight: 3000, width: 80, height: 15, 
                              depth: '', sku: 'SOU751-SA2MSU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'supplier is mandatory' do
        # Arrange
        pm = ProductModel.new(name: 'Samsung', weight: 3000, width: 80, height: 15, 
                              depth: 20, sku: 'S1OU71-SAM7SU-NOIZ77', supplier: nil)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
    end

    it 'false when sku is repeated' do
      # Arrange
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                phone_number: '(45)12345-1234')
      first_pm = ProductModel.create!(name: 'TV', weight: 3000, width: 80, height: 15, 
                                  depth: 20, sku: 'SO1U71-SA1MSU-NOIZ77', supplier: supplier)
      second_pm = ProductModel.new(name: 'SMART TV', weight: 3000, width: 80, height: 15, 
                                  depth: 20, sku: 'SO1U71-SA1MSU-NOIZ77', supplier: supplier)
      # Act
      result = second_pm.valid?
      # Assert
      expect(result).to eq false
    end

    context 'length' do
      it 'weight must be greater than 0' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'TV', weight: 0, width: 80, height: 15, 
                                    depth: 20, sku: 'SOU771-SA4MSU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'height must be greater than 0' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'TV', weight: 3000, width: 80, height: 0, 
                                    depth: 20, sku: 'SOU771-SAM7SU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'depth must be greater than 0' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'TV', weight: 3000, width: 80, height: 15, 
                                    depth: 0, sku: 'S7OU71-7SAMSU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
      
      it 'width must be greater than 0' do
        # Arrange
        supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                  registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                  city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                  phone_number: '(45)12345-1234')
        pm = ProductModel.new(name: 'TV', weight: 3000, width: 0, height: 15, 
                                    depth: 20, sku: '8SOU71-8SAMSU-NOIZ77', supplier: supplier)
        # Act
        result = pm.valid?
        # Assert
        expect(result).to eq false
      end
    end

    it 'sku must have length eq to 18' do
      # Arrange
      supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', 
                                registration_number: 1259647851236, full_address: 'Av das Palmas, 100', 
                                city: 'Bauru', state: 'SP', email: 'acme@gmail.com', 
                                phone_number: '(45)12345-1234')
      pm = ProductModel.new(name: 'TV', weight: 3000, width: 80, height: 15, 
                                  depth: 20, sku: 'SOU718-NOIZ77', supplier: supplier)
      # Act
      result = pm.valid?
      # Assert
      expect(result).to eq false
    end
  end
end
