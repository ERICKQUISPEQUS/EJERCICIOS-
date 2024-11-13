# Cargar librerías necesarias
library(ggplot2)

# Definir los datos
X <- c(2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000)  # Ingresos ($)
Y <- c(1500, 2300, 3100, 4000, 4800, 5600, 6400, 7200, 8000, 8900)    # Gastos ($)

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
  geom_point(color = "blue", size = 3) +  # Puntos de datos reales
  geom_line(aes(x = X, y = Y_pred), color = "red", size = 1.5, linetype = "solid") +  # Línea de regresión
  labs(
    title = "Regresión lineal: Gastos vs Ingresos",
    x = "Ingresos ($)",
    y = "Gastos ($)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  # Eliminar leyenda, ya que no es necesaria
