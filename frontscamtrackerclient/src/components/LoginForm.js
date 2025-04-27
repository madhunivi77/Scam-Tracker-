import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import './LoginForm.css';

const API_BASE = 'http://127.0.0.1:5000';

export default function LoginForm() {
  const [user_email, setUserEmail]       = useState('');
  const [user_password, setUserPassword] = useState('');
  const [error, setError]                = useState('');
  const navigate = useNavigate();

  const handleSubmit = async e => {
    e.preventDefault();
    setError('');
    try {
      const res = await fetch(`${API_BASE}/api/auth/login`, {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_email, user_password })
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.message || 'Login failed');
      localStorage.setItem('uid', data.uid);
  localStorage.setItem('user_name', data.user_name);
      navigate('/dashboard');
      
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <form className="login-form" onSubmit={handleSubmit}>
      <h2 className="form-title">Log In</h2>
      {error && <div className="form-error">{error}</div>}

      <label className="form-label">
        Email
        <input
          type="email"
          className="form-input"
          value={user_email}
          onChange={e => setUserEmail(e.target.value)}
          required
        />
      </label>

      <label className="form-label">
        Password
        <input
          type="password"
          className="form-input"
          value={user_password}
          onChange={e => setUserPassword(e.target.value)}
          required
        />
      </label>

      <button type="submit" className="form-button">
        Log In
      </button>
      <p className="form-footer">
       Don’t have an account? <Link to="/register">Register here</Link>
      </p>
     </form>
   );
}
