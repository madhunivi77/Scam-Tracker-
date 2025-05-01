// src/components/Dashboard.js
import React, { useEffect, useState } from 'react';

const API_BASE = 'http://127.0.0.1:5000';

export default function Dashboard() {
  // ─── State ───────────────────────────────────────
  const [view, setView]               = useState('home');
  const [types, setTypes]             = useState([]);
  const [form, setForm]               = useState({
    tid: '', report_date: '', report_country: '',
    report_loss: '', report_description: ''
  });
  const [message, setMessage]         = useState('');
  const [authCountry, setAuthCountry] = useState('');
  const [authorities, setAuthorities] = useState([]);
  const [tips, setTips]               = useState([]);

  // ─── Fetch scam‐types ─────────────────────────────
  useEffect(() => {
    fetch(`${API_BASE}/api/scam/types`)
      .then(r => r.json())
      .then(setTypes)
      .catch(console.error);
  }, []);

  // ─── “Not logged in” guard ────────────────────────
  const userName = localStorage.getItem('user_name');
  const uid      = localStorage.getItem('uid');
  if (!userName || !uid) {
    return <p style={{ color: 'red' }}>Not logged in</p>;
  }

  // ─── Handlers ────────────────────────────────────
  const handleReportSubmit = async e => {
    e.preventDefault();
    setMessage('');
    const payload = { uid, ...form };
    const res = await fetch(`${API_BASE}/api/scam/report`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });
    const data = await res.json();
    setMessage(res.ok ? 'Report submitted!' : data.message || 'Error');
  };

  const handleFetchAuthorities = async () => {
    setMessage('');
    const res = await fetch(
      `${API_BASE}/api/scam/authorities?country=${encodeURIComponent(authCountry)}`
    );
    const data = await res.json();
    if (!res.ok) setMessage(data.message || 'Error');
    else setAuthorities(data);
  };

  const handleFetchTips = async () => {
    setMessage('');
    const res = await fetch(`${API_BASE}/api/scam/tips`);
    const data = await res.json();
    if (!res.ok) setMessage(data.message || 'Error');
    else setTips(data);
  };

  // ─── Render helpers ───────────────────────────────
  const renderHome = () => (
    <div>
      <button onClick={() => { setView('report');      setMessage(''); }}>
        Report a Scam
      </button>
      <button onClick={() => { setView('authorities'); setMessage(''); }}>
        Contact Scam Authorities
      </button>
      <button onClick={() => { setView('tips');        setMessage(''); }}>
        View Prevention Tips
      </button>
    </div>
  );

  const renderReportForm = () => (
    <form onSubmit={handleReportSubmit}>
      <h2>Report a Scam</h2>
      <select
        required
        value={form.tid}
        onChange={e => setForm({ ...form, tid: e.target.value })}
      >
        <option value="">Select Scam Type</option>
        {types.map(t => (
          <option key={t.tid} value={t.tid}>
            {t.type_description}
          </option>
        ))}
      </select>
      <input
        type="date" required
        value={form.report_date}
        onChange={e => setForm({ ...form, report_date: e.target.value })}
      />
      <input
        type="text" placeholder="Country" required
        value={form.report_country}
        onChange={e => setForm({ ...form, report_country: e.target.value })}
      />
      <input
        type="number" placeholder="Financial Loss" required
        value={form.report_loss}
        onChange={e => setForm({ ...form, report_loss: e.target.value })}
      />
      <textarea
        placeholder="Description" required
        value={form.report_description}
        onChange={e => setForm({ ...form, report_description: e.target.value })}
      />
      <button type="submit">Submit</button>
      <button type="button" onClick={() => setView('home')}>
        Back
      </button>
      {message && <p>{message}</p>}
    </form>
  );

  const renderAuthoritiesView = () => (
    <div>
      <h2>Contact Scam Authorities</h2>
      <input
        placeholder="Country"
        value={authCountry}
        onChange={e => setAuthCountry(e.target.value)}
      />
      <button onClick={handleFetchAuthorities}>Search</button>
      <button onClick={() => setView('home')}>Back</button>
      {message && <p>{message}</p>}
      <ul>
        {authorities.map(a => (
          <li key={a.org_id}>
            {a.org_name} – {a.org_contact}
          </li>
        ))}
      </ul>
    </div>
  );

  const renderTipsView = () => (
    <div>
      <h2>Prevention Tips</h2>
      <button onClick={handleFetchTips}>Load Tips</button>
      <button onClick={() => setView('home')}>Back</button>
      {message && <p>{message}</p>}
      <ul>
        {tips.map(t => (
          <li key={t.tid}>{t.tip_text}</li>
        ))}
      </ul>
    </div>
  );

  // ─── Main render ────────────────────────────────
  return (
    <div style={{ padding: '2rem' }}>
      <h1>Welcome, {userName}!</h1>
      {view === 'home'        && renderHome()}
      {view === 'report'      && renderReportForm()}
      {view === 'authorities' && renderAuthoritiesView()}
      {view === 'tips'        && renderTipsView()}
    </div>
  );
}
