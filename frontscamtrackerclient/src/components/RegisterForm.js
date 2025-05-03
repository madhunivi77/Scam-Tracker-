import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import "./RegisterForm.css";

const API_BASE = "http://127.0.0.1:5000";

export default function RegisterForm() {
  const [user_name, setUserName] = useState("");
  const [user_email, setUserEmail] = useState("");
  const [user_password, setUserPassword] = useState("");
  const [user_phone, setUserPhone] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    try {
      const res = await fetch(`${API_BASE}/api/auth/register`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          user_name,
          user_email,
          user_password,
          user_phone,
        }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.message || "Registration failed");

      alert("Account created successfully!");
      navigate("/");
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <form className="register-form" onSubmit={handleSubmit}>
      <h2 className="form-title">Register</h2>

      {error && <div className="form-error">{error}</div>}

      <label className="form-label">
        Name
        <input
          type="text"
          className="form-input"
          value={user_name}
          onChange={(e) => setUserName(e.target.value)}
          required
        />
      </label>

      <label className="form-label">
        Email
        <input
          type="email"
          className="form-input"
          value={user_email}
          onChange={(e) => setUserEmail(e.target.value)}
          required
        />
      </label>

      <label className="form-label">
        Password
        <input
          type="password"
          className="form-input"
          value={user_password}
          onChange={(e) => setUserPassword(e.target.value)}
          required
        />
      </label>

      <label className="form-label">
        Phone
        <input
          type="tel"
          className="form-input"
          value={user_phone}
          onChange={(e) => setUserPhone(e.target.value)}
        />
      </label>

      <button type="submit" className="form-button">
        Create Account
      </button>
      <p className="form-footer">
        Already created an account? <Link to="/">Login here</Link>
      </p>
    </form>
  );
}
