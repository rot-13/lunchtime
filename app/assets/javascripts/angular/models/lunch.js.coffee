class window.Lunch

  constructor: (@id, @date, @votes = [], @visits = []) ->

  getRestaurants: ->
    _.uniq(_.map(@votes, (vote) -> vote.restaurant))

  # vote methods
  # NOTE: all those methods are nested under lunch and not under restaurant because a user votes on
  # a restaurant in a specific lunch and in the next lunch he may not vote for it so the context here is lunch

  votesForRestaurant: (restaurant) ->
    _.select(@votes, (vote) -> vote.restaurant == restaurant)

  userVotes: (user) ->
    _.select(@votes, (vote) -> vote.user == user)

  userVotedRestaurants: (user) ->
    _.pluck(@userVotes(user), 'restaurant')

  votersForRestaurant: (restaurant) ->
    _.pluck(@votesForRestaurant(restaurant), 'user')

  userVoteForRestaurant: (user, restaurant) ->
    _.find(@votesForRestaurant(restaurant), (vote) -> vote.user == user)

  isVotedForRestaurant: (user, restaurant) ->
    @userVoteForRestaurant(user, restaurant)?

  addVote: (vote) ->
    @votes.push vote unless @containsVote(vote)

  removeVote: (vote) ->
    @votes = _.reject(@votes, (currVote) -> currVote.isEqual(vote))

  containsVote: (vote) ->
    _.find(@votes, (currVote) -> currVote.isEqual(vote))?

  ## visit methods ##

  userVisit: (user) ->
    _.findWhere(@visits, user: user)

  addVisit: (visit) ->
    @visits.push visit

  removeVisit: (visit) ->
    @visits.splice(@visits.indexOf(visit), 1)

  hasVisited: (restaurant = null) ->
    if restaurant
      _.findWhere(@visits, user: User.current, restaurant: restaurant)
    else
      _.findWhere(@visits, user: User.current)


