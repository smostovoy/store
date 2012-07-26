class Check #< Try

  #cache :first

  def first(user, value)
    type :query
    arg1 = user.arg1
    arg2 = user.arg2
    #where checks method name to add clause
    try or: [{some: arg1}, {other: 2}] #=> count
  end

  def second(value1, value)
    type :base
     1 and 3 and try([value1, value])
  end

  def third
    type :db
  end

  def fourth user
    Check2.instance.first and first(user, nil)
  end
end