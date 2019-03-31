class Validator

	def positive_number(number)
 		return number>=0 ? true : false
	end

	def valid_email(email)
		return (email.include?("@") and email.include?(".")) ? true : false
	end

	def strong_password(password)
		return (password.length >=6) ? true : false
	end

	def pocket_name_validator(name)
		return (name.length >= 1 and name[0]!= " ")? true : false
	end

	def goal_name_validator(name)
		return (name.length >= 1 and name[0]!= " ")? true : false
	end
end