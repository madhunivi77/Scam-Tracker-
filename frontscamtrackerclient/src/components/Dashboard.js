import React from 'react';

export default function Dashboard() {
  const userName = localStorage.getItem('user_name');
  if (!userName) {
    return <p style={{ color: 'red' }}>Not logged in</p>;
  }
  return (
    <div style={{ padding: '2rem' }}>
      <h1>Welcome, {userName}!</h1>
      <p>🎉 You have successfully logged in.</p>
    </div>
  );
}
