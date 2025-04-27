import React from 'react'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import LoginForm    from './components/LoginForm'
import RegisterForm from './components/RegisterForm'
import Dashboard    from './components/Dashboard'
import './App.css'

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <header className="App-header"><h1>Scam Tracker</h1></header>
        <main className="App-main">
          <Routes>
            <Route path="/"        element={<LoginForm />} />
            <Route path="/register" element={<RegisterForm />} />
            <Route path="/dashboard" element={<Dashboard />} />
          </Routes>
        </main>
      </div>
    </BrowserRouter>
  )
}

export default App