require 'puppet'
require 'puppet/parser/expression/branch'

# An object that returns a boolean which is the boolean not
# of the given value.
class Puppet::Parser::Expression
  class Not < Expression::Branch
    attr_accessor :value

    def each
      yield @value
    end

    def compute_denotation(scope)
      val = @value.denotation(scope)
      return ! Puppet::Parser::Scope.true?(val)
    end
  end
end