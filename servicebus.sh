# create a queue
az servicebus queue create --namespace-name pluralsight --name testqueue --resource-group pluralsight

# delete a queue
az servicebus queue delete --namespace-name pluralsight --name testqueue

export AZURE_SERVICE_BUS_CONNECTION_STRING="<CONN STRING>"

# create a topic
az servicebus topic create --namespace-name pluralsight
    --name testtopic --resource-group pluralsight

# delete a topic
az servicebus topic delete --namespace-name pluralsight
    --name testtopic

# create a subscription
az servicebus topic subscription create --namespace-name pluralsight
    --name testsub --topic-name testtopic