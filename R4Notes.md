Goals --> Jobs --> Task list 

Goals:
- High level.
  - I'd like to stand be over there
  - Interact with object A
  - Move object A to position/object B
  - Contains Job Queue


Job:
- Mid level
  - Path to location
  - Pick up object
  - Dropoff object


Task list
  - Lowest level. The actual moment-to-moment actions.
  - Move to location (Not the path. the actual movement segments)
  - Pickup object in nearby location. (No movement needed)
  - Drop currently held object




Example Goals:
- I'd like to be standing at location X
  - Create Job queue:
    1. Add Job to queue: Path to location X
  - Start job at the front of queue
  - Job 1: Path to location X
    1. Do I have a path? If no, ask path manager for a path.
    2. Path comes back from path manager as a task list. 
    3. Merge that task list with any list I may already have.
    4. Execute task list for job.
      1. Move to location X-1
      2. Move to location X-2
      3. Etc.
      4. Move to location X
      5. Task list complete.
    5. Job complete.
  - Next job in queue?
  - Goal complete.

- Move Object A to location X
  - Create Job queue:
    1. Add Job to queue: Pickup Object A
    2. Add Job to queue: Dropoff currently held Object at Location X
  - Start job at the front of queue
  - Job 1: Pickup Object A
    1. Do I have a path to Object A's location? If no, ask path manager for a path.
    2. Path comes back from path manager as a task list. 
    3. Merge that task list with any list I may already have.
    4. Append task to pickup object A.
    5. Execute task list for Job.
      1. Move to location of Object A-1
      2. Move to location of Object A-2 
      3. Etc.
      4. Move to location of Object A
      5. Pickup Object A
      6. Task list complete.
    6. Job complete.
  - Next job in queue? 
  - Job 2: Dropoff Currently held Object at location X
    1. Do I have a path to Location X? If no, ask path manager for a path.
    2. Path comes back from path manager as a task list. 
    3. Merge that task list with any list I may already have.
    4. Append task to dropoff currently held object.
    5. Execute task list for Job.
      1. Move to location X-1
      2. Move to location X-2
      3. Etc.
      4. Move to location X
      5. Dropoff currently held object
      6. Task list complete.
    6. Job complete.
  - Next job in queue?
  - Goal complete.

