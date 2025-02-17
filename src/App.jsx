import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [halakToData, setHalakToData] = useState([]);
  const [horgaszokData, setHorgaszokData] = useState([]);
  const [largestFishData, setLargestFishData] = useState([]);

  useEffect(() => {
    axios.get('https://localhost:7126/api/Halak/halak/to')
      .then(response => {
        setHalakToData(response.data);
        console.log(response.data);
      })
      .catch(error => console.error('Hiba történt a Halak a tó adatok lekérésekor:', error));

    axios.get('https://localhost:7126/api/Halak/horgaszok/fogasok')
      .then(response => {
        setHorgaszokData(response.data);
        console.log(response.data);
      })
      .catch(error => console.error('Hiba történt a Horgászok és Halak adatok lekérésekor:', error));

    axios.get('https://localhost:7126/api/Halak/halak/legnagyobb')
      .then(response => {
        setLargestFishData(response.data);
        console.log(response.data);
      })
      .catch(error => console.error('Hiba történt a legnagyobb halak adatok lekérésekor:', error));
  }, []);

  return (
    <div className="App">
      <h1>Halak és Horgászok</h1>

      <h2>Halak a tó nevével</h2>
      <ul>
        {halakToData.map((item, index) => (
          <li key={index}>
            <strong>{item.halNev}</strong> a <strong>{item.toNev}</strong> tóhoz kapcsolódik
          </li>
        ))}
      </ul>

      <h2>Horgászok és a fogásaik</h2>
      <ul>
        {horgaszokData.map((item, index) => (
          <li key={index}>
            <strong>{item.horgaszNev}</strong> egy <strong>{item.halNev}</strong> (faj: {item.halFaj}) halat fogott {new Date(item.datum).toLocaleDateString()}-on
          </li>
        ))}
      </ul>

      <h2>Top 3 legnagyobb hal</h2>
      <ul>
        {largestFishData.map((item, index) => (
          <li key={index}>
            <strong>{item.halNev}</strong> - {item.meretCm} cm
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
