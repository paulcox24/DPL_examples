class Encryptor

	def cipher(rotation)
		characters = (' '..'z').to_a
		rotated_characters = characters.rotate(rotation)
		Hash[characters.zip(rotated_characters)]   
  end

  def encrypt_letter(letter, rotation)
  	cipher_for_rotation = cipher(rotation)
	  cipher_for_rotation[letter]
	end

	def decrypt_letter(letter, rotation)
		rotation = -rotation
  	cipher_for_rotation = cipher(rotation)
	  cipher_for_rotation[letter]
	end

  def encrypt(string, rotation)
  	letters = string.split("")
  	@resultse = letters.collect do |letter|
  		encrypted_letter = encrypt_letter(letter, rotation)
  	end
  	@resultse = @resultse.join
  end

  def decrypt(string, rotation)
  	letters = string.split("")
  	@resultsd = letters.collect do |letter|
  		decrypted_letter = decrypt_letter(letter, rotation)
  	end
  	@resultsd = @resultsd.join
  end

  def encrypt_file(filename, rotation)

		# Create the file handle to the input file
		file1 = File.open(filename, "r")
		# Read the text of the input file
		file_read = file1.read
		# Encrypt the text
		encrypted_text = encrypt(file_read, rotation)
		# Create a name for the output file # Create an output file handle
		file2 = File.open(filename + ".encrypted", "w")
		# Write out the text
		file2.write(encrypted_text)
		# Close the file
		file2.close
	end

	def decrypt_file(filename, rotation)
		#Create the file handle to the encrypted file
		file_encrypted = File.open(filename, "r")
		# Read the encrypted text
		encrypted_text = file_encrypted.read
		# Decrypt the text by passing in the text and rotation
		decrypted_text = decrypt(encrypted_text, rotation)
		# Create a name for the decrypted file 
		# Create an output file handle
		decrypted_file = File.open(filename.gsub("encrypted", "decrypted"), "w")
		# Write out the text
		decrypted_file.write(decrypted_text)
		# Close the file
		decrypted_file.close
	end

	def prompt_user
		puts "What would you like to encrypt/decrypt?\nString or File?"
		user_choice = gets.chomp.downcase
		user_choice = user_choice[0]
		if user_choice == 's'
			puts "Enter a string."
			user_string = gets.chomp
			puts "Number of rotations?"
			rotations = gets.chomp.to_i
			puts "Encrypt or Decrypt?"
			enc_dec = gets.chomp.downcase
			enc_dec = enc_dec[0]	
				if enc_dec == 'e'
					encrypt(user_string, rotations)
					puts "\nYour encrypted string is.\n#{@resultse}"
				elsif enc_dec == 'd'
					decrypt(user_string, rotations)
					puts "\nYour decrypted string is.\n#{@resultsd}"
				end
			
		elsif user_choice == 'f'
			puts "Enter a filename"
			user_file = gets.chomp
			puts "Number of rotations?"
			rotations = gets.chomp.to_i
			puts "Encrypt or Decrypt?"
			enc_dec = gets.chomp.downcase
			enc_dec = enc_dec[0]	
				if enc_dec == 'e'
					encrypt_file(user_file, rotations)
				elsif enc_dec == 'd'
					decrypt_file(user_file, rotations)
				end 
		end
  end
end

e = Encryptor.new
e.prompt_user()
