
def arrange_b_after_a(a, b)
  if @secret.index(a) > @secret.index(b)
    @secret.delete a
    @secret.insert(@secret.index(b), a)
  end
end

def recover_secret(triplets)
  @secret = triplets.flatten.uniq
  triplets.each do |a|
    arrange_b_after_a(a[0], a[1])
    arrange_b_after_a(a[0], a[2])
    arrange_b_after_a(a[1], a[2])
  end
  @secret
end

secret_1 = "whatisup"
triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]
p recover_secret triplets_1
p "equal to #{secret_1}?"