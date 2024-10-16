# Copy .env.example to .env if it doesn't exist
if [ ! -f .env ]; then
  cp .env.example .env
fi

source .env

composer dump-autoload --optimize

if [ -z "$APP_KEY" ]; then
  echo "APP_KEY is empty, generating..."
  php artisan key:generate
fi

#php artisan migrate

#php artisan livewire:publish --assets

npm run build

#Full permissions on Storage
chmod -R 777 /app/storage /app/bootstrap/cache

