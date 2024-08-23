echo "Criando as imagens ......."

docker build -t diesouza/projeto-backend:1.0 backend/.
docker build -t diesouza/projeto-database:1.0 database/.

echo "Realizando o push das imagens ...."

docker push diesouza/projeto-backend:1.0 
docker push diesouza/projeto-database:1.0

echo "Criando servicos no cluster kubernets ...."

kubectl apply -f ./services.yml

echo "Criando deployments ...."

kubectl apply -f ./deployments.yml