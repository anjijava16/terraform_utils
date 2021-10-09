# Meta Arguments:
 1. depends_on: To handle resource or module depedencies that terraform can't automatically infer 
 2. count: Multiple resource instance accoring to a count 
 3. for_each: To create Multiple instances according to a map,or set of strings 
 4. provider: For a selecting a non -default provider configuration 
 5. lifecycle: Standard resource behvaior can be altered using special nested lifecyle block with in a resource block body 
 6. Provisioners and Connections 
 ** Ntote: A given resource or Module block cannot use both count and for_each 
