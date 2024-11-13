# Cargar librerías necesarias
library(ggplot2)

# Generar los datos de ejemplo
# Datos: número de habitaciones (X) y precio de la casa (Y)
X <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)  # Número de habitaciones
Y <- c(100000, 150000, 200000, 250000, 300000, 350000, 400000, 450000, 500000, 550000)  # Precio de la casa

# Ajustar el modelo de regresión lineal
modelo <- lm(Y ~ X)

# Obtener las predicciones del modelo
Y_pred <- predict(modelo)

# Calcular el coeficiente de determinación R^2
r2 <- summary(modelo)$r.squared
cat(sprintf("Coeficiente de correlación (R^2): %.2f\n", r2))

# Crear un data.frame para facilitar el gráfico
data <- data.frame(X, Y, Y_pred)

# Crear el gráfico de dispersión con la línea de regresión
ggplot(data, aes(x = X, y = Y)) +
  geom_point(color = "blue", size = 3) +  # Puntos de datos observados
  geom_line(aes(x = X, y = Y_pred), color = "red", size = 1.5, linetype = "solid") +  # Línea de regresión
  labs(
    title = "Regresión lineal: Precio vs Número de habitaciones",
    x = "Número de habitaciones",
    y = "Precio de la casa ($)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  # Eliminar leyenda, ya que no es necesaria
