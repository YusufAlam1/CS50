# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Reasons For: Every server is guaranteed to be divided in space equally reducing the chance of a server overload which avoids that catalyst of a single point of failure.

Reasons Against: You will always hae to query each boat for most operation slowing down the process.

Conclusion: Overall this method prioritizes space over time and would scale best for a dataset thats inheritly naturally distributed to begin with.

## Partitioning by Hour

Reasons For: Since a dedicated boat is responsible for all times, it will be easy to query and orobably easier to send one boat out for each time from a logistics standpoint. This method optimizes the boats.

Reasons Against: Hours 0-7 are high volume due to better fish detection, there is a chance the server may overload. Additionally there is wasted potential for the servers B and C as there is unused space that could be evenly distributed maximizing utility per server.

Conclusion: As you can see partitioning by hour has the opposite advantage and disadvantage as random partitioning.
Here there is a plus on time, but a risk on space.

## Partitioning by Hash Value

Reasons For: This method takes all the good aspects of random partitioning keeping the servers evenly distributed, with the added pro that specific timestamps can be easily queried if the hash is known.

Reasons Against: Hashing still takes the disadvantage from random partitioning as broader queries do still need all boats to preform for accuracy. An additional issue presents as changing number of partitions is costly to remap.

Conclusion: While partitioning by has values is a great middle ground between the two prior options it is not perfect and it does have its unique drawbacks.
