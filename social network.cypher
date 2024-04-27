// Nodes for People
CREATE (lgm:Person {name: "Lord George MaCartney", born: 1737, died: 1806, occupation: "Missionary", nationality: "UK"})
CREATE (rf:Person {name: "Robert Fortune", born: 1812, died: 1880, occupations: ["Botanist", "Traveler"], nationality: "UK"})
CREATE (mhg:Person {name: "Mrs. John Henry Gray", occupation: "archdeacon of Hong Kong"})
CREATE (jhg:Person {name: "John Henry Gray", born: 1823, died: 1890, occupation: "Consular chaplain at Canton", description: "one of the largest and earliest collections of curiosities and objets d’art", Book: "Walks in the City of Canton"})

// Nodes for Events
CREATE (firstMission:Event {name: "First mission", year: 1793})
CREATE (lgm)-[:PARTICIPATED_IN]->(firstMission)

CREATE (teaSmuggling:Event {name: "Smuggling of Chinese tea plants", description: "Smuggled Chinese tea plants out of the country into India"})
CREATE (rf)-[:PARTICIPATED_IN]->(teaSmuggling)

CREATE (porcelainSpecimens:Item {name: "Specimens of porcelain", description: "Including items apparently from the Summer Palace"})
CREATE (vase:Item {name: "Chinese vase", description: "Fourteen inches high, coloured with the richest red", location: "Canton"})

CREATE (cantonShops:Place {name: "Curiosity Shops in Canton", description: "Mid-19th-century, many of the valuables come from the pawn-shops, and are sold as unredeemed pledges, but a great deal that is exhibited is stolen property."})


// Nodes for Places
CREATE (cc:Place {name: "China's Curio"})
CREATE (canton:Place {name: "Canton[Guangzhou]"})
CREATE (shanghai:Place {name: "Shanghai"})
CREATE (ningpo:Place {name: "Ningbo"})
CREATE (hongkong:Place {name: "Hongkong"})
CREATE (pohing:Place {name: "Pohing’s Chinaware shop", purpose: "for European purchasers intended", creation: "Kin-Tee-Ching[Jingdezhen]"})
CREATE (yc:Place {name: "Chinaware store of Yi-Chung"})
CREATE (sp:Place {name: "Summer Palace", location: "Beijing"})
CREATE (christies:Place {name: "Christie's UK"})
CREATE (uk:Place {name: "UK"})

// Relationships for purchases and sales
CREATE (lgm)-[:PURCHASED_FROM]->(cc)
CREATE (cc)-[:SOLD_TO]->(lgm)
CREATE (lgm)-[:CARRYING_TO]->(uk)
CREATE (lgm)-[:SENDING_BACK]->(uk)
CREATE (rf)-[:PURCHASED]->(canton)
CREATE (rf)-[:PURCHASED]->(shanghai)
CREATE (rf)-[:MADE_ACQUAINTANCE_IN]->(ningpo)
CREATE (rf)-[:ACQUIRED]->(porcelainSpecimens)
CREATE (rf)-[:PURCHASED]->(vase)
CREATE (rf)-[:SHIPPED]->(uk) 
CREATE (mhg)-[:LIVED_IN]->(canton)
CREATE (jhg)-[:VISITED]->(pohing)
CREATE (mhg)-[:MARRIED_TO]->(jhg)
CREATE (porcelainSpecimens)-[:SOLD_AT]->(christies)
CREATE (porcelainSpecimens)-[:ORIGINATED_FROM]->(sp)

// Relationships for locations
CREATE (cantonShops)-[:LOCATED_IN]->(canton)
CREATE (pohing)-[:LOCATED_IN]->(canton)
CREATE (yc)-[:LOCATED_IN]->(canton)

// More specific transactions involving Robert Fortune

MERGE (rf)-[:PURCHASED {itemDescription: "vase, fourteen inches high, richest red"}]->(canton)
MERGE (rf)-[:ACQUIRED_FROM]->(sp) 


// Associating Mrs. John Henry Gray with the description of the shops

CREATE (observation:Event {name: "Observation of Curiosity Shops", description: "Many of the valuables come from the pawn-shops, and are sold as unredeemed pledges, but a great deal that is exhibited is stolen property.", quotedBy: "Mrs. John Henry Gray"})
CREATE (mhg)-[:DESCRIBED]->(observation)
CREATE (observation)-[:ABOUT]->(cantonShops)



// Describing the acquisition process and exhibitions
CREATE (viennaExhibition:Event {name: "Vienna Exhibition", year: 1873})
CREATE (summerExhibition:Event {name: "Summer Exhibition", year: 1874, location: "Crystal Palace, London"})

CREATE (jhg)-[:EXHIBITED_ITEMS_AT]->(viennaExhibition)
CREATE (jhg)-[:EXHIBITED_ITEMS_AT]->(summerExhibition)







