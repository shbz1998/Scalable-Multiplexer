# Scalable Multiplexer
## Shahbaz Hassan Khan Malik

This is a scalable MUX with the following characterstics:
1. The size of the data ports is determined by a parameter, SIZE. 
If the multiplexer is not scaled when instantiated, it defaults to one bit wide.
2. Input A is selected when sel = 0 and input B when sel = 1. When sel is 
unknown, the multiplexer resolves any bits for which A and B are the same. 
Any bits in conflict result in x outputs.  

<img width="536" alt="Screen Shot 2022-05-04 at 1 28 01 PM" src="https://user-images.githubusercontent.com/98668171/166820318-a0992fa1-4574-425f-8299-4a4a11e34eeb.png">
