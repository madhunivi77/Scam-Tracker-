// src/components/Dashboard.js
import React, { useEffect, useState } from "react";
import "./ReportsByCountry.css";
import "./MyReports.css";
// Intro.js imports
import introJs from "intro.js";
import "intro.js/introjs.css";

const API_BASE = "http://127.0.0.1:5000";

export default function Dashboard() {
  // ─── State ───────────────────────────────────────
  const [view, setView] = useState("home");
  const [types, setTypes] = useState([]);
  const [form, setForm] = useState({
    tid: "",
    report_date: "",
    report_country: "",
    report_loss: "",
    report_description: "",
  });
  const [message, setMessage] = useState("");
  const [isSuccess, setIsSuccess] = useState(false);
  const [authCountry, setAuthCountry] = useState("");
  const [authorities, setAuthorities] = useState([]);
  const [tips, setTips] = useState([]);
  const [countryCounts, setCountryCounts] = useState([]);
  const [myReports, setMyReports] = useState([]);
  const [editingReport, setEditingReport] = useState(null);
  const [editForm, setEditForm] = useState({
    rid: "",
    tid: "",
    report_date: "",
    report_country: "",
    report_loss: "",
    report_description: "",
  });

  // ─── Fetch scam‐types ─────────────────────────────
  useEffect(() => {
    fetch(`${API_BASE}/api/scam/types`)
      .then((r) => r.json())
      .then(setTypes)
      .catch(console.error);
  }, []);

  // ─── “Not logged in” guard ────────────────────────
  const userName = localStorage.getItem("user_name")
    ? localStorage.getItem("user_name")
    : "<username>";
  const uid = localStorage.getItem("uid");
  if (!userName || !uid) {
    return <p style={{ color: "red" }}>Not logged in</p>;
  }

  // ─── Handlers ────────────────────────────────────
  const handleReportSubmit = async (e) => {
    e.preventDefault();
    setMessage("");
    setIsSuccess(false);
    const payload = { uid, ...form };
    const res = await fetch(`${API_BASE}/api/scam/report`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });
    const data = await res.json();
    if (res.ok) {
      setIsSuccess(true);
      setMessage("Report submitted successfully!");
      setForm({
        tid: "",
        report_date: "",
        report_country: "",
        report_loss: "",
        report_description: "",
      });
    } else {
      setIsSuccess(false);
      setMessage(data.message || "Submission failed");
    }
  };

  const handleFetchAuthorities = async () => {
    setMessage("");
    const res = await fetch(
      `${API_BASE}/api/scam/authorities?country=${encodeURIComponent(
        authCountry
      )}`
    );
    const data = await res.json();
    if (!res.ok) setMessage(data.message || "Error");
    else setAuthorities(data);
  };

  const handleFetchTips = async () => {
    setMessage("");
    const res = await fetch(`${API_BASE}/api/scam/tips`);
    const data = await res.json();
    if (!res.ok) setMessage(data.message || "Error");
    else setTips(data);
  };

  const handleFetchByCountry = async () => {
    setMessage("");
    const res = await fetch(`${API_BASE}/api/scam/reports-by-country`);
    const data = await res.json();
    if (!res.ok) setMessage(data.message || "Error");
    else setCountryCounts(data);
  };

  const handleFetchMyReports = async () => {
    setMessage("");
    const res = await fetch(`${API_BASE}/api/scam/reports?uid=${uid}`);
    const data = await res.json();
    if (!res.ok) setMessage(data.message || "Error");
    else setMyReports(data);
  };

  const handleDeleteReport = async (rid) => {
    if (!window.confirm("Delete this report?")) return;
    const res = await fetch(`${API_BASE}/api/scam/report/${rid}`, {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ uid }),
    });
    const data = await res.json();
    if (res.ok) {
      setMessage("Report deleted");
      handleFetchMyReports();
    } else {
      setMessage(data.message || "Error");
    }
  };

  const startEdit = (report) => {
    setEditingReport(report.rid);
    setEditForm({ ...report });
  };

  const handleEditSubmit = async (e) => {
    e.preventDefault();
    const res = await fetch(`${API_BASE}/api/scam/report/${editingReport}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ uid, ...editForm }),
    });
    const data = await res.json();
    if (res.ok) {
      setMessage("Report updated");
      setEditingReport(null);
      handleFetchMyReports();
    } else {
      setMessage(data.message || "Error");
    }
  };

  const cancelEdit = () => {
    setEditingReport(null);
    setMessage("");
  };

  // ─── Tutorial handler ────────────────────────────
  const startTutorial = () => {
    introJs()
      .setOptions({
        steps: [
          { element: "#btn-report", intro: "Report a scam here." },
          { element: "#btn-authorities", intro: "Find scam authorities." },
          { element: "#btn-tips", intro: "View prevention tips." },
          { element: "#btn-byCountry", intro: "See reports by country." },
          { element: "#btn-myReports", intro: "Manage your own reports." },
        ],
      })
      .start();
  };

  // ─── Render helpers ───────────────────────────────
  const renderHome = () => (
    <div className="form-container">
      <button
        id="btn-report"
        onClick={() => {
          setView("report");
          setMessage("");
        }}
      >
        Report a Scam
      </button>
      <button
        id="btn-authorities"
        onClick={() => {
          setView("authorities");
          setMessage("");
        }}
      >
        Contact Scam Authorities
      </button>
      <button
        id="btn-tips"
        onClick={() => {
          setView("tips");
          setMessage("");
        }}
      >
        View Prevention Tips
      </button>
      <button
        id="btn-byCountry"
        onClick={() => {
          setView("byCountry");
          setMessage("");
        }}
      >
        Reports by Country
      </button>
      <button
        id="btn-myReports"
        onClick={() => {
          setView("myReports");
          setMessage("");
          handleFetchMyReports();
        }}
      >
        My Reports
      </button>
    </div>
  );

  const renderReportForm = () => (
    <form onSubmit={handleReportSubmit}>
      <h2
        style={{
          color: "#00ffe0",
          textShadow: "0 0 8px #00ffe0",
        }}
      >
        Report A Scam
      </h2>
      <select
        required
        value={form.tid}
        onChange={(e) => setForm({ ...form, tid: e.target.value })}
      >
        <option value="">Select Scam Type (required)</option>
        {types.map((t) => (
          <option key={t.tid} value={t.tid}>
            {t.type_description}
          </option>
        ))}
      </select>
      <input
        type="date"
        required
        value={form.report_date}
        style={{ fontFamily: "Arial" }}
        onChange={(e) => setForm({ ...form, report_date: e.target.value })}
      />
      <input
        type="text"
        placeholder="Country (required)"
        required
        value={form.report_country}
        onChange={(e) => setForm({ ...form, report_country: e.target.value })}
      />
      <input
        type="number"
        placeholder="Financial Loss (required)"
        required
        value={form.report_loss}
        onChange={(e) => setForm({ ...form, report_loss: e.target.value })}
      />
      <textarea
        placeholder="Description (required)"
        required
        value={form.report_description}
        style={{ fontFamily: "Arial" }}
        onChange={(e) =>
          setForm({ ...form, report_description: e.target.value })
        }
      />
      <button type="submit">Submit</button>
      <button type="button" onClick={() => setView("home")}>
        Back
      </button>
      {message && (
        <p style={{ color: isSuccess ? "green" : "red", marginTop: "1rem" }}>
          {message}
        </p>
      )}
    </form>
  );

  const renderAuthoritiesView = () => (
    <div>
      <h2
        style={{
          color: "#00ffe0",
          textShadow: "0 0 8px #00ffe0",
        }}
      >
        Contact Scam Authorities
      </h2>
      <input
        placeholder="Country"
        value={authCountry}
        onChange={(e) => setAuthCountry(e.target.value)}
      />
      <button onClick={handleFetchAuthorities}>Search</button>
      <button onClick={() => setView("home")}>Back</button>
      {message && <p>{message}</p>}
      <ul>
        {authorities.map((a) => (
          <li key={a.org_id}>
            {a.org_name} – {a.org_contact}
          </li>
        ))}
      </ul>
    </div>
  );

  const renderTipsView = () => (
    <div>
      <h2
        style={{
          color: "#00ffe0",
          textShadow: "0 0 8px #00ffe0",
        }}
      >
        Prevention Tips
      </h2>
      <button onClick={handleFetchTips}>Load Tips</button>
      <button onClick={() => setView("home")}>Back</button>
      {message && <p>{message}</p>}
      <ul>
        {tips.map((t) => (
          <li key={t.tid}>{t.tip_text}</li>
        ))}
      </ul>
    </div>
  );

  const renderByCountryView = () => (
    <div style={{ display: "flex", flexDirection: "column" }}>
      <h2
        style={{
          color: "#00ffe0",
          textShadow: "0 0 8px #00ffe0",
        }}
      >
        Reports By Country
      </h2>
      <div>
        <button onClick={handleFetchByCountry}>Load Table</button>
        <button onClick={() => setView("home")}>Back</button>
      </div>
      {message && <p className="error">{message}</p>}
      <table className="reports-by-country">
        <thead>
          <tr>
            <th>Country</th>
            <th># Reports</th>
          </tr>
        </thead>
        <tbody>
          {countryCounts.map((r) => (
            <tr key={r.country}>
              <td>{r.country}</td>
              <td>{r.count}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );

  const renderMyReportsView = () => (
    <div className="my-reports">
      <h2
        style={{
          color: "#00ffe0",
          textShadow: "0 0 8px #00ffe0",
        }}
      >
        My Submitted Reports
      </h2>
      <button
        onClick={() => {
          setView("home");
          setMessage("");
        }}
      >
        Back
      </button>
      {message && <p className="error">{message}</p>}
      <table>
        <thead>
          <tr>
            <th>Type</th>
            <th>Date</th>
            <th>Country</th>
            <th>Loss</th>
            <th>Description</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {myReports.map((r) => (
            <tr key={r.rid}>
              {editingReport === r.rid ? (
                <td colSpan="6">
                  <form onSubmit={handleEditSubmit} className="edit-form">
                    <select
                      value={editForm.tid}
                      onChange={(e) =>
                        setEditForm({ ...editForm, tid: e.target.value })
                      }
                      required
                    >
                      {types.map((t) => (
                        <option key={t.tid} value={t.tid}>
                          {t.type_description}
                        </option>
                      ))}
                    </select>
                    <input
                      type="date"
                      value={editForm.report_date}
                      onChange={(e) =>
                        setEditForm({
                          ...editForm,
                          report_date: e.target.value,
                        })
                      }
                      required
                    />
                    <input
                      type="text"
                      value={editForm.report_country}
                      onChange={(e) =>
                        setEditForm({
                          ...editForm,
                          report_country: e.target.value,
                        })
                      }
                      required
                    />
                    <input
                      type="number"
                      value={editForm.report_loss}
                      onChange={(e) =>
                        setEditForm({
                          ...editForm,
                          report_loss: e.target.value,
                        })
                      }
                      required
                    />
                    <textarea
                      value={editForm.report_description}
                      onChange={(e) =>
                        setEditForm({
                          ...editForm,
                          report_description: e.target.value,
                        })
                      }
                      required
                    />
                    <button type="submit">Save</button>
                    <button type="button" onClick={cancelEdit}>
                      Cancel
                    </button>
                  </form>
                </td>
              ) : (
                <>
                  <td>{r.tid}</td>
                  <td>{r.report_date}</td>
                  <td>{r.report_country}</td>
                  <td>{r.report_loss}</td>
                  <td>{r.report_description}</td>
                  <td>
                    <button onClick={() => startEdit(r)}>Edit</button>
                    <button onClick={() => handleDeleteReport(r.rid)}>
                      Delete
                    </button>
                  </td>
                </>
              )}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );

  // ─── Main render ────────────────────────────────
  return (
    <div
      style={{
        padding: "2rem",
        position: "relative",
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignContent: "center",
      }}
    >
      {/* Tutorial button in top‐right */}
      <button
        onClick={startTutorial}
        style={{ position: "absolute", top: "1rem", right: "-9.5rem" }}
      >
        Tutorial
      </button>

      <h1>Welcome, {userName}!</h1>
      {view === "home" && renderHome()}
      {view === "report" && renderReportForm()}
      {view === "authorities" && renderAuthoritiesView()}
      {view === "tips" && renderTipsView()}
      {view === "byCountry" && renderByCountryView()}
      {view === "myReports" && renderMyReportsView()}
    </div>
  );
}
