

# Fluents and Axioms used

  

![](https://lh3.googleusercontent.com/GR_3-t-3sQzdXK5eBu7kwEYke_p2FiyHxwzAOszOsSD__lvgeSoQ-lfYk3nRzFc_S2lnKkkJwduC7-R2U-pba5RKcfd8fHZT7qoz5gaaYuq31qk1dDbM0LL4VwyA92FPmpBQldaRRtnjNw5Pwv1ulmnRas4GXt_jJWS97LxN-bxeUK6LjCgVLV4kOPPdtw)

  

Here we see the first part of the code ,

### goal(S)

  

When this query is run it calls result(A1,s0).

S0 being the initial state. A1 will be what comes out of this result call .

The final A1 will be unified with S and returned to the user.

  

From there I have a helper predicate , that will call all the required details from the knowledge base fed into our code.

  
![](https://lh4.googleusercontent.com/1EWwVcs3utET3zcV7LtEh8ehLVeLa21rdgolHjITU1siVaWyWFKMi9pMMMrbdh3C4gyOa0nKTz00P12x64KfGqAUREMC4-z84JanV-5KWNlyxQMZ_kTphHIXBl8z4m3tDl471QaW4-Bl3ewH0mn3PegYBzPpYOqPrT1gXAcxyqAcp-zpa1J6Wze88U7vFg)

In this example we are using KB.pl like the one in the project document. So I can test the test cases on it easier.

  

I will pass all the parameters of the KB. with 0 being the ships rescued , the empty list represents the visited cells in the map. Reason being is because in earlier implementations the code would run forever. Then it would return an error with full stack. More on that error in the errors met section. Keeping the list of visited cells easily solves this issue.

  

Only key is that as soon as we pickup a ship we immediately return it to empty again that being so that it can reach the station incase it has visited it or it locking itself in place.

  

The code is pretty much the same all over here.

Except for minor differences

  

## Goal

Goal case is reached as soon as the ships is empty, agent a station , that being the agent’s X = the station X and Y = station’s Y.

In which case we return A and add to the result drop , S0 where S0 is all the previous states.

  

### Normal states

I commented them as Minor drop, pickup , left , right , up and down.

  

![](https://lh5.googleusercontent.com/s9-mEBblkx0r-5bOGU2Xtq9O7PUj0LA4Ul7joE0qyIcWZtzBBSBQYe0JcB1mEeeX4fEFd1Z4yOx5IuSoQmrt5yZ_zlveRCOCa6x8IwAg9tpttOkAOwfhdHMYIkLfboruEpM9mNJNelkgbTnaWR9AsTYdJXpHfk6Ewx3YDjk7MSivzzZ6KCJhdxzC3drIfw)

  
  

![](https://lh4.googleusercontent.com/zw_2MnPXctdSfRlxGcA3ENikycVlH0FD8FAX5H4DghCkZG11eI1aNLFz_rFWG_lbHDuSEOGfGJ-475y7liHR98gO_zMPZGS_mR5dRwWOwRj0K39QuSkJMhu6R_iBRieIcWAzbqcFYvKlkZJD1fMw_BXcAgkWhqGF5QoKqOUCh9OmXTUSThenQbc9h1SiAA)Up right left down are pretty much the same we add the current location to the visited cells list. And before we can proceed we check if we are on a visited cell or not. If not then we add it and add to the result ( direction , S0) where again S0 is all previous states. ( Which starts as s0 ).

  

Then we change the xy values according to the appropriate motion applied, ie if right we increase the Y if left we decreases it and so on.

  

### Minor Drop, Pickup

In order to pickup we check if we have capacity or not we check if we are on a ship or not, we then add ship to the carried , then we remove the ship from the list using the delete method.

We finally make sure that the visited cells is also rest to empty in the call to let the agent move freely in the next part.

  

In order to do minor drop we rest again the list , add drop and do the same as the above we check if we are on a station , then we check if we have full capacity or we can carry more.

If we can then we can continue to find the ship. Else we drop and then continue.

  
  
  
  
  
  
  
  

## TestCases

![](https://lh5.googleusercontent.com/TOjP1pw3it7IYk1L8PMfryyOwWFfVSDoLLwQKWGNKRa7VvjqqgNPXBSo3sPBC1efGvGIjhLnp4f-22yZPnR3_DEELE4ICWbDE2Va6ZBN5qnHt0aslutlQ2nlk1CcVyO-R4Cmi_HF6samTrdLw-HTJ4l6il2KhpdJBV44-Qd0x8m6qrzsZvmkzFl1zkPm_w)

  

The following is the test cases in the Project report.

I ran other test cases where the capacity was one and it worked as well.

  

## Errors/Issues met and their solutions

  

#### Infinite loop,

Fixed by having the visited list. Which rests everytime we visit a milestone , a Milestone is actions like pickup and drop.

  

#### Not able to check wether an element is in a list or not
 Fixed by creating a file to practice on lists.
