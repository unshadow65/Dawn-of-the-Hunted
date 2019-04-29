// Spawn zombies inside buildings only

allValidBuildings = nearestTerrainObjects [[worldSize/2, worldSize/2], ["House"], worldSize];

hint parseText ("<t size= '2'>TOTAL VALID BUILDINGS:<br/> "+(str count allValidBuildings)+"</t>");