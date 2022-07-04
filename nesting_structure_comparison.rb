# frozen_string_literal: true
class Array
  def compare(arr1, arr2)
    return false unless arr1.size == arr2.size
    return false unless arr1.instance_of? arr2.class

    arr1.size.times do |i|
      if (arr1[i].is_a?(Array) && (arr1[i].is_a? Array)) || (arr1[i].is_a?(Hash) && arr2[i].is_a?(Hash))
        return false unless compare(arr1[i], arr2[i])
      elsif !arr1[i].is_a?(Array) && !arr2[i].is_a?(Array)
        next
      else
        return false
      end
    end
    true
  end

  def same_structure_as(arr)
    compare(self, arr)
  end
end

p [55, 76].same_structure_as [1, 3]
p [55, 76].same_structure_as [1]
p [[1, 3], [1]].same_structure_as [[2, 3], [1]]
p [[1, 3], []].same_structure_as [[2, 3], []]
p [ [ [ ], [ ] ] ].same_structure_as( [ [ 1, 1 ] ] )
p "above should be false"
p [1,[1,1]].same_structure_as [[2,2],2]

