--> Requires
require('__libraries'); -- My own Lib
require('Commande');
require('Distributeur');
require('GestionCommandes');
require('Produit');
require('PersistanceSQL');
require('Test');

--> Distributeurs
local Distributeur = Distributeur('carr15432', 'Carreclerc');

--> Gestion Commandes
local GestionCommandes = GestionCommandes();
local GetNonLivres = GestionCommandes:XmlNonLivrees(Distributeur);
print(GetNonLivres);