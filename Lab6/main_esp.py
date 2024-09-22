# 1. Importa el paquete NUMPY bajo el nombre np.
import numpy as np

# 2. Imprime la versión de NUMPY y la configuración.
print("Versión de NumPy:", np.__version__)

# 3. Genera un array tridimensional de 2x3x5 con valores aleatorios. Asigna el array a la variable "a".
# Un array tridimensional es como tener varias "tablas" de valores.
a = np.random.random((2, 3, 5))  # Usamos random() para generar valores aleatorios.

# 4. Imprime a.
print("Array a:\n", a)

# 5. Crea un array tridimensional de 5x2x3 con todos los valores igual a 1. 
# Usamos ones() para crear un array lleno de unos.
b = np.ones((5, 2, 3))

# 6. Imprime b.
print("Array b:\n", b)

# 7. ¿Tienen a y b el mismo tamaño? ¿Cómo lo demostramos en código Python?
# El tamaño es la cantidad total de elementos en el array. Lo verificamos usando size.
print("¿Tienen el mismo tamaño a y b?:", a.size == b.size)

# 8. ¿Es posible sumar a y b? 
# Vamos a intentarlo, si no funciona veremos por qué.
try:
    suma_ab = a + b
except ValueError as error:
    print("No se puede sumar a y b porque:", error)

# 9. Transpone b para que tenga la misma forma que a (es decir, un array de 2x3x5).
# Usamos la función transpose() para cambiar el orden de las dimensiones.
c = np.transpose(b, (1, 2, 0))

# 10. Ahora intentamos sumar a y c. Esto debería funcionar.
d = a + c
print("Array d (resultado de sumar a y c):\n", d)
# Funciona porque ahora tienen la misma forma (2x3x5), es decir, el mismo número de filas, columnas y tablas.

# 11. Imprime a y d. Compara los dos arrays.
print("Array a:\n", a)
print("Array d:\n", d)
# Observación: d es como a, pero con todos los valores aumentados en 1, porque sumamos un array lleno de 1's (c).

# 12. Multiplica a y c. Asigna el resultado a e.
e = a * c
print("Array e (resultado de multiplicar a y c):\n", e)

# 13. ¿Es e igual a a? Vamos a comprobar.
# e será igual a a porque al multiplicar un número por 1, el resultado es el mismo número.
print("¿e es igual a a?:", np.array_equal(e, a))

# 14. Identifica los valores máximos, mínimos y medios en d.
d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)

print("Valor máximo en d:", d_max)
print("Valor mínimo en d:", d_min)
print("Valor medio en d:", d_mean)

# 15. Crea un array vacío "f" con la misma forma que d.
f = np.empty_like(d)

# 16. Rellena los valores en f según las reglas.
for i in range(d.shape[0]):  # Recorre cada "tabla" en el array d.
    for j in range(d.shape[1]):  # Recorre cada fila.
        for k in range(d.shape[2]):  # Recorre cada columna.
            if d[i, j, k] == d_min:
                f[i, j, k] = 0
            elif d[i, j, k] == d_max:
                f[i, j, k] = 100
            elif d[i, j, k] == d_mean:
                f[i, j, k] = 50
            elif d_min < d[i, j, k] < d_mean:
                f[i, j, k] = 25
            elif d_mean < d[i, j, k] < d_max:
                f[i, j, k] = 75

# 17. Imprime d y f para ver si el array f se ha llenado correctamente.
print("Array d:\n", d)
print("Array f (con valores 0, 25, 50, 75, 100):\n", f)

# 18. Bonus: Etiquetar los valores con letras en lugar de números.


# Imprime el array con letras.

