#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix
  
  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)
	postFix = Array.new()
	stack = Array.new()
	symbolArray = exprStr.split
	for sym in symbolArray
		#print "Symbol" + sym + "\n "
		if(operand?(sym))
			postFix.push(sym) 
		end
		if(isLeftParen?(sym))
			stack.push(sym)
			
		end
		if(operator?(sym))
			while(stackPrecedence(stack.last) >= inputPrecedence(sym))
				postFix.push(stack.pop())
			end
			stack.push(sym)
		end
		if(isRightParen?(sym))
			while(!isLeftParen?(stack.last))
				postFix.push(stack.pop())
			end
			stack.pop()
			
			
		end
	end
	while(stack.length() > 0)
		postFix.push(stack.pop())
		#print " Popped: " + postFix.last() + "\n"
	end  
	ret_string = ''
    for sym in postFix
		ret_string += sym + ' '
    end
    return ret_string.chop
  end
  
  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)
    stack = Array.new()
    pfix = infixToPostfix(exprStr)
	symbolArray = pfix.split
	#symbolArray.reverse!();
	for sym in symbolArray
		if(operand?(sym))
				stack.push(sym) 
		else
				x = stack.pop()
				y = stack.pop()
				z = applyOperator(x,y,sym)
				stack.push(z)
				
		end
	end
	
	return stack.pop()
    
  end
  
  private # subsequent methods are private methods
  
  # returns true if the input is an operator and false otherwise
  def operator?(str)
    if(str == '+' || str == '-' || str == '*' || str == '/' ||  str == '%' || str == '^' || str == '(' || str == ')')
	return true
    else 
	return false 
    end 

  end
  
  # returns true if the input is an operand and false otherwise
  def operand?(str)
   if(str != '+' && str != '-' && str != '*' && str != '/' &&  str != '%' && str != '^' && str != '(' && str != ')')
   	return true
   else 	
 	return false 
   end
  end
  
  # returns true if the input is a left parenthesis and false otherwise
  def isLeftParen?(str)
    if(str == '(')
	return true
    else
	return false
    end
  end
  
  # returns true if the input is a right parenthesis and false otherwise
  def isRightParen?(str)
     if(str == ')')
	return true
    else
	return false
    end
  end
  
  # returns the stack precedence of the input operator
  def stackPrecedence(operator)
	   if(operator == '+' || operator == '-')
	   	return 1
	   elsif(operator == '*' || operator == '/'||  operator == '%')
	   	return 2
	   elsif(operator == '^')
	   	return 3
	   elsif(operator == '(' || operator == ')')
		return -1
	   end	
	   return -5 
  end
  
  # returns the input precedence of the input operator
  def inputPrecedence(operator)
	   if(operator == '+' || operator == '-')
	   	return 1
	   elsif(operator == '*' || operator == '/' ||  operator == '%')
	   	return 2
	   elsif(operator == '^')
	   	return 4
	   elsif(operator == '(' || operator == ')')
		return 5
	   end	
  end
  
  # applies the operators to num1 and num2 and returns the result
  def applyOperator(num1, num2, operator)
       if(operator == '+') 
	   	return num1.to_i + num2.to_i
	   elsif(operator == '-') 
	   	return num1.to_i - num2.to_i
	   elsif(operator == '*') 
	   	return num1.to_i * num2.to_i
	   elsif(operator == '/') 
	   	return num1.to_i / num2.to_i
	   elsif(operator == '%') 
	   	return num1.to_i % num2.to_i
	   elsif(operator == '^') 
	   	return num1.to_i ** num2.to_i	       
	   end
  end
end

#
#  main driver for the program - similar to the main() function in Project 2
#
def main()
 myPostFix = InfixPostfix.new
 line = $stdin.readline()     
 puts(myPostFix.infixToPostfix(line))
 puts(myPostFix.evaluatePostfix(line))
end

# invoke main function
main()
