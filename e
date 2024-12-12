<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Random Dinosaur Facts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f0f0f0;
        }

        .fact-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        #random-fact-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        #random-fact-btn:hover {
            background-color: #34495e;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <h1>🦖 Random Dinosaur Facts 🦕</h1>
    <button id="random-fact-btn">Show Random Fact</button>
    <div id="fact-display" class="fact-card"></div>

    <script>
        // Function to fetch and display random fact
        async function loadAndDisplayFact() {
            try {
                const response = await fetch('dinosaur-facts.json');
                const data = await response.json();
                const facts = data.dinosaurFacts;
                const randomFact = facts[Math.floor(Math.random() * facts.length)];
                
                document.getElementById('fact-display').innerHTML = `
                    <strong>Fact #${randomFact.id}:</strong><br>
                    ${randomFact.fact}
                `;
            } catch (error) {
                console.error('Error loading facts:', error);
                document.getElementById('fact-display').innerHTML = 'Error loading fact. Please try again.';
            }
        }

        // Add click event listener to button
        document.getElementById('random-fact-btn').addEventListener('click', loadAndDisplayFact);

        // Load initial random fact
        loadAndDisplayFact();
    </script>
</body>
</html>
