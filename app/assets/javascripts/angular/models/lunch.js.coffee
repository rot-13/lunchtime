class window.Lunch

  constructor: (@id, @date, @votes = []) ->

  getRestaurants: ->
    _.uniq(_.map(@votes, (vote) -> vote.restaurant))

  # vote methods
  # NOTE: all those methods are nested under lunch and not under restaurant because a user votes on
  # a restaurant in a specific lunch and in the next lunch he may not vote for it so the context here is lunch

  votesForRestaurant: (restaurant) ->
    _.select(@votes, (vote) -> vote.restaurant == restaurant)

  votersForRestaurant: (restaurant) ->
    _.pluck(@votesForRestaurant(restaurant), 'user')

  userVoteForRestaurant: (user, restaurant) ->
    _.find(@votesForRestaurant(restaurant), (vote) -> vote.user == user)

  isVotedForRestaurant: (user, restaurant) ->
    @userVoteForRestaurant(user, restaurant)?

  addVote: (vote) ->
    @votes.push vote

  removeVote: (vote) ->
    @votes.splice(@votes.indexOf(vote), 1)
