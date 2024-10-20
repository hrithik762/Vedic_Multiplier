# Vedic_Multiplier

The vedic4mul module implements a 4x4-bit Vedic multiplier based on the Vedic mathematics algorithm for fast multiplication. This architecture divides the multiplication problem into smaller blocks using 2x2 Vedic multiplier modules.

The Vedic multiplier is built using smaller 2x2 multiplier modules that are combined hierarchically. The result is obtained by computing partial products and summing them using a series of adders.

### Module Details:
1. vedic_2_x_2: Computes the product of two 2-bit numbers, generating a 4-bit result.

2. add_6_bit: Adds two 6-bit numbers, used to sum the partial products.

3. ha (Half Adder): Used within the vedic_2_x_2 module to sum partial results and generate carry bits.

4. vedic4mul: The main 4x4 multiplier module that integrates the smaller 2x2 multipliers.
