--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-02 17:44:51 MST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16569)
-- Name: scam_authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scam_authorities (
    org_id integer NOT NULL,
    org_name character varying(50) NOT NULL,
    org_country character varying(100),
    org_contact character varying(100)
);


ALTER TABLE public.scam_authorities OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16609)
-- Name: scam_prevention_tips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scam_prevention_tips (
    tid integer,
    tip_text character varying(500) NOT NULL
);


ALTER TABLE public.scam_prevention_tips OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16594)
-- Name: scam_report_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scam_report_sources (
    sid integer NOT NULL,
    rid integer NOT NULL
);


ALTER TABLE public.scam_report_sources OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16663)
-- Name: scam_reports_rid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scam_reports_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scam_reports_rid_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16574)
-- Name: scam_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scam_reports (
    rid integer DEFAULT nextval('public.scam_reports_rid_seq'::regclass) NOT NULL,
    uid integer,
    tid integer,
    report_loss double precision,
    report_description text,
    report_date date,
    report_country character varying(100)
);


ALTER TABLE public.scam_reports OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16589)
-- Name: scam_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scam_sources (
    sid integer NOT NULL,
    source_type character varying(50),
    source_name character varying(100)
);


ALTER TABLE public.scam_sources OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16564)
-- Name: scam_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scam_types (
    tid integer NOT NULL,
    type_name character varying(50) NOT NULL,
    type_description character varying(100)
);


ALTER TABLE public.scam_types OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16646)
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_uid_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16555)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    uid integer DEFAULT nextval('public.users_uid_seq'::regclass) NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(50) NOT NULL,
    user_password character varying(150) NOT NULL,
    user_phone character varying(100),
    user_type character varying(4)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3645 (class 0 OID 16569)
-- Dependencies: 219
-- Data for Name: scam_authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scam_authorities (org_id, org_name, org_country, org_contact) FROM stdin;
1	Mybuzz	Democratic Republic of the Congo	294-147-8612
2	Divape	Indonesia	304-470-2196
3	Feedspan	France	692-939-9492
4	Mydeo	China	300-259-7011
5	Dabfeed	Brazil	452-972-4586
6	Tazz	China	355-568-5475
7	Skynoodle	Indonesia	985-825-2990
8	Agivu	China	440-222-6459
9	Riffpedia	Portugal	484-566-7991
10	Gabtype	Philippines	643-610-3062
11	Quamba	Syria	508-309-9704
12	Jatri	Indonesia	104-931-8389
13	Latz	China	527-413-7416
14	Geba	Burundi	391-596-9582
15	Yotz	China	128-911-8928
16	Thoughtsphere	Paraguay	176-295-3162
17	Skinder	France	918-126-7722
18	Jabberstorm	Azerbaijan	293-344-3811
19	Devshare	Russia	434-368-2814
20	Skynoodle	United States	517-516-4719
21	Trudeo	Philippines	953-803-4060
22	Shuffledrive	Germany	701-937-6405
23	Divape	Philippines	703-168-6758
24	Mudo	Cuba	754-430-8363
25	Ooba	Poland	672-996-5262
26	Cogilith	Canada	291-218-7093
27	Ainyx	China	500-416-3936
28	Rhyloo	Philippines	318-914-8561
29	Oyoba	Tunisia	510-905-5626
30	Gabspot	China	854-499-1910
31	Avamm	Argentina	849-727-8657
32	Viva	Mexico	568-767-5529
33	Oodoo	Indonesia	908-392-7469
34	Thoughtblab	China	185-856-4547
35	Zoomdog	Bulgaria	444-992-3739
36	Topicware	Ivory Coast	380-784-3184
37	Thoughtstorm	China	334-556-3492
38	Katz	Canada	679-312-6547
39	Wordify	Czech Republic	640-452-2052
40	Tagchat	Czech Republic	257-905-5749
41	Jayo	France	451-393-2927
42	Gabtune	Philippines	482-470-0998
43	Fiveclub	Thailand	657-910-7304
44	Babbleopia	Indonesia	904-688-5936
45	Quinu	Indonesia	657-663-7256
46	Brainbox	Dominica	114-432-7320
47	Edgetag	China	472-969-3704
48	Voolith	Indonesia	973-244-4321
49	Blognation	Indonesia	478-178-5381
50	Rhyloo	China	863-193-9846
51	Divape	Portugal	356-455-7292
52	Jaxnation	Mexico	487-393-9620
53	Youspan	Sweden	348-443-9014
54	Browsedrive	Indonesia	785-632-7467
55	Trunyx	Sweden	397-494-6920
56	Brainverse	Cuba	468-858-5726
57	Blogtags	Argentina	715-141-5153
58	Feedspan	Armenia	786-861-6040
59	Yakijo	France	391-302-4988
60	Buzzster	France	621-768-0141
61	Dynabox	Italy	983-213-8267
62	Tagopia	Ecuador	457-775-9844
63	Snaptags	Indonesia	294-739-1389
64	Abata	China	860-653-7254
65	Skiptube	Mexico	257-520-3912
66	Edgewire	Brazil	595-372-1901
67	Topiczoom	Sweden	348-746-6730
68	Brainlounge	Argentina	170-365-9333
69	Digitube	China	943-711-0528
70	Wordify	Armenia	471-841-3488
71	Thoughtbeat	Germany	413-797-4031
72	Twitterwire	Vietnam	991-713-1768
73	Aibox	Sierra Leone	577-875-0667
74	Meedoo	Brazil	784-993-1914
75	Devify	France	422-925-4438
76	Shufflester	Chile	764-947-5965
77	Innojam	China	272-876-9079
78	Realpoint	Philippines	862-750-0758
79	Agimba	Latvia	839-735-7497
80	Riffpath	Argentina	516-799-2458
81	Janyx	Taiwan	670-415-7147
82	Mycat	Thailand	572-895-6939
83	Blogtag	Indonesia	609-185-4564
84	Kaymbo	China	369-812-2736
85	Youopia	Greece	226-228-0208
86	Twitterworks	China	455-739-0490
87	Zooxo	Indonesia	689-299-5961
88	Kayveo	Poland	406-616-2895
89	Voolith	Botswana	722-496-1798
90	Twinte	China	785-937-0067
91	Eare	Tanzania	149-384-1772
92	Podcat	Philippines	757-121-0623
93	Dabvine	Brazil	398-278-3781
94	Meemm	China	206-678-4711
95	Quire	Indonesia	706-673-5891
96	Skajo	Malta	491-279-4849
97	Rhynoodle	Colombia	579-945-2195
98	Yakijo	Palestinian Territory	417-608-3697
99	Buzzbean	Jamaica	742-192-1385
100	Dabfeed	Spain	881-356-6840
101	Skibox	China	787-519-2208
102	Rooxo	Poland	757-634-3716
103	Riffpath	Indonesia	480-747-8844
104	Topiczoom	Brazil	608-192-4262
105	Quamba	Indonesia	849-700-5374
106	Roombo	Greece	479-243-5629
107	Agivu	Netherlands	533-333-2353
108	Devify	Greece	895-701-4319
109	Browsedrive	Iran	700-630-7210
110	Devbug	Brazil	841-756-1055
111	Wikivu	China	325-672-6728
112	Twitterlist	Brazil	143-225-0382
113	Ainyx	Czech Republic	930-261-6361
114	Flipstorm	Indonesia	442-690-8324
115	Kaymbo	Poland	582-482-9930
116	Blogspan	Czech Republic	726-406-6668
117	Rhyloo	Indonesia	815-639-6450
118	Pixope	Indonesia	765-755-3619
119	Jayo	Argentina	754-241-1910
120	Oba	Palestinian Territory	977-171-7890
121	Wikido	Russia	987-233-6427
122	Kazio	Namibia	162-795-5808
123	Yakijo	Vietnam	854-851-6741
124	Jabberstorm	Brazil	516-752-7676
125	Browsebug	Poland	208-233-0781
126	Yata	Portugal	180-217-0074
127	Gigaclub	China	204-407-4804
128	Trudoo	Egypt	614-344-5989
129	Flashpoint	Indonesia	200-810-0058
130	Photobug	China	323-824-9452
131	Topdrive	Philippines	524-945-5634
132	Divanoodle	Portugal	518-516-8483
133	Quaxo	China	796-442-4621
134	Riffpedia	Indonesia	384-812-3938
135	Aibox	Poland	706-328-1258
136	Realcube	Mongolia	357-480-9727
137	Yakijo	Indonesia	498-446-7909
138	Aimbu	Brazil	290-545-3445
139	Jaxworks	China	664-179-5251
140	Skidoo	China	497-503-3617
141	Tagcat	Honduras	707-155-7012
142	Meeveo	South Korea	688-191-2665
143	Aibox	China	329-928-9368
144	Demimbu	Russia	865-844-6561
145	Mynte	Japan	195-383-4014
146	Skyvu	Ecuador	863-287-9691
147	Cogilith	Indonesia	991-369-9751
148	Realfire	Russia	255-177-7359
149	Livepath	Philippines	754-368-5163
150	Topicware	Czech Republic	843-341-3574
151	Yamia	Indonesia	225-148-1845
152	Yata	China	375-184-2520
153	Rhynyx	Central African Republic	964-288-6658
154	Fanoodle	Argentina	178-202-1329
155	Wikivu	Poland	336-762-5154
156	Skinix	Ireland	199-715-3114
157	Kwinu	Brazil	145-172-4766
158	Skynoodle	Canada	871-425-0489
159	Mydeo	Nigeria	855-816-1153
160	Voolia	China	298-690-1801
161	Wordware	Russia	576-488-7902
162	Skidoo	Guatemala	422-252-3794
163	Browsedrive	Vietnam	118-249-6832
164	Browsedrive	Indonesia	793-175-0566
165	Twitterbeat	Poland	843-998-7942
166	Skimia	China	314-692-6786
167	Wordpedia	China	986-724-5284
168	Realcube	Poland	212-247-4839
169	Quatz	Morocco	244-743-8187
170	Yodo	Brazil	870-998-6505
171	Oyope	Guatemala	823-903-7607
172	Yodoo	Russia	572-922-2721
173	Dabshots	Bulgaria	419-535-1142
174	Trupe	Philippines	322-306-7582
175	Kanoodle	Indonesia	623-768-7335
176	Quinu	Kazakhstan	137-104-4860
177	Linktype	Poland	963-513-6205
178	Mynte	Philippines	355-249-0690
179	Eazzy	Sweden	638-442-3628
180	Lajo	Egypt	271-251-6244
181	Yambee	Philippines	379-629-3276
182	Wordtune	Sweden	793-506-6022
183	Divape	Japan	634-788-4468
184	Brightdog	Brazil	378-668-5316
185	Wordtune	China	371-541-5195
186	Youfeed	Zimbabwe	237-340-9319
187	Kanoodle	Comoros	114-787-6351
188	Yambee	Madagascar	969-215-9875
189	Bluezoom	Philippines	110-348-1397
190	Zazio	Ukraine	875-326-9808
191	Kazu	Indonesia	867-743-7709
192	Browsedrive	Guatemala	971-246-6889
193	Dabvine	Kyrgyzstan	333-233-5668
194	Meeveo	Poland	357-789-9120
195	Eare	Indonesia	624-736-3814
196	Jaxbean	Philippines	688-613-2149
197	Skyble	Philippines	541-716-2966
198	Cogidoo	Russia	854-548-6478
199	Lazzy	United States	816-914-9954
200	Voomm	United States	288-009-2233
201	Yambee	China	331-568-0647
202	Ozu	Ukraine	184-358-0137
203	Babbleset	Sweden	868-141-6376
204	Skipstorm	Peru	802-591-2873
205	Kimia	Japan	122-278-7308
206	Quimm	Brazil	673-710-6589
207	Meejo	Kenya	726-898-1946
208	Yakijo	Djibouti	109-787-7261
209	Tagfeed	United States	626-362-7454
210	Shufflester	China	593-345-5350
211	Flipstorm	Bosnia and Herzegovina	369-769-7427
212	Voolith	China	406-267-9630
213	Mita	Thailand	748-314-4772
214	Gabspot	Russia	719-525-9181
215	Thoughtbeat	Czech Republic	246-588-0287
216	Browsecat	Nigeria	823-308-1753
217	Skalith	Poland	715-247-4674
218	Tagcat	France	843-901-1672
219	Babbleset	France	604-126-5837
220	Minyx	China	551-877-0369
221	Youspan	Indonesia	133-154-4643
222	Feedbug	Argentina	578-983-8022
223	Zoomdog	Lithuania	278-371-1043
224	Oyoloo	Peru	937-636-1628
225	Zoonder	China	688-481-4201
226	Plajo	Poland	200-906-6728
227	Realmix	Indonesia	578-877-5366
228	Pixonyx	Tajikistan	369-231-2026
229	Thoughtmix	China	341-485-3812
230	Skinder	Russia	518-522-8629
231	Oyope	Luxembourg	584-858-9782
232	Camido	Japan	113-911-5132
233	Skinte	China	544-758-6593
234	Divavu	France	535-666-7500
235	Shuffledrive	Poland	236-254-7010
236	Zava	Philippines	710-579-9230
237	Oodoo	Philippines	853-107-7137
238	Skiptube	Brazil	544-666-3604
239	Edgewire	Honduras	263-879-2137
240	Devbug	Czech Republic	284-703-7728
241	Eire	Brazil	487-340-3108
242	Realbuzz	Philippines	895-415-7818
243	Gabvine	France	907-817-9337
244	Dabshots	Japan	913-430-2100
245	Divanoodle	China	518-823-0381
246	Jabberbean	Indonesia	446-901-0306
247	Feednation	China	891-736-2193
248	Yodel	Canada	302-597-4003
249	Babblestorm	Finland	331-394-5203
250	Feednation	South Africa	813-182-2247
251	Tazzy	China	934-988-6933
252	Skaboo	Samoa	171-140-5057
253	Blogtags	Venezuela	547-157-9610
254	Ntags	China	167-982-0109
255	Kwilith	Brazil	938-866-2573
256	Twitterbridge	Greece	278-275-6647
257	Centizu	Czech Republic	840-843-5507
258	Thoughtmix	China	330-840-3584
259	Tagpad	Colombia	421-870-9698
260	Thoughtworks	Guatemala	190-761-1652
261	Buzzbean	Russia	198-376-6768
262	Trudeo	Russia	288-786-1114
263	Tazzy	Nicaragua	421-180-9965
264	Avamba	Russia	562-469-9778
265	Skiba	Colombia	424-916-7024
266	Edgepulse	France	602-127-6805
267	Eadel	Indonesia	268-104-3673
268	Youfeed	Gambia	931-869-8451
269	Realmix	Mexico	730-972-5469
270	Brainsphere	Russia	778-181-5130
271	Teklist	Indonesia	735-211-4418
272	Kazu	Portugal	143-655-2521
273	Trudeo	Poland	139-777-8963
274	Avaveo	Indonesia	562-559-6483
275	Jatri	China	187-713-6533
276	Zooxo	Russia	256-997-9489
277	Youbridge	Barbados	536-974-2171
278	Brightbean	France	464-845-2856
279	Talane	Ethiopia	210-722-6348
280	Chatterbridge	Kyrgyzstan	429-359-0955
281	Gigaclub	China	937-445-5069
282	Lajo	Indonesia	207-157-5262
283	Thoughtstorm	Indonesia	531-269-4157
284	Gabspot	Brazil	868-541-6243
285	Skinder	Indonesia	672-381-8724
286	Skilith	Ukraine	795-520-3480
287	Realpoint	Indonesia	486-318-3324
288	Flipbug	Italy	301-795-7833
289	Meemm	Philippines	582-939-8869
290	Skibox	Russia	918-361-8527
291	Twitterlist	Brazil	606-848-5748
292	Shuffledrive	Russia	806-535-0159
293	Youspan	Australia	602-271-7042
294	Snaptags	Kazakhstan	950-875-1493
295	Gabcube	Chile	591-119-4009
296	Mydeo	Czech Republic	602-509-0814
297	Linkbridge	Indonesia	587-170-9429
298	Flashpoint	Sweden	116-600-1540
299	Tagcat	Philippines	915-504-6332
300	Browsedrive	Indonesia	226-558-2284
\.


--
-- TOC entry 3649 (class 0 OID 16609)
-- Dependencies: 223
-- Data for Name: scam_prevention_tips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scam_prevention_tips (tid, tip_text) FROM stdin;
1	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.
2	Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.
3	In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.
4	Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.
5	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.
\.


--
-- TOC entry 3648 (class 0 OID 16594)
-- Dependencies: 222
-- Data for Name: scam_report_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scam_report_sources (sid, rid) FROM stdin;
44	1
235	2
70	3
115	4
127	5
57	6
114	7
62	8
278	9
164	10
110	11
221	12
24	13
130	14
39	15
12	16
47	17
6	18
203	19
15	20
270	21
81	22
136	23
158	24
60	25
104	26
293	27
289	28
204	29
10	30
112	31
92	32
299	33
52	34
176	35
145	36
94	37
88	38
274	39
99	40
38	41
17	42
78	43
166	44
53	45
292	46
89	47
14	48
79	49
165	50
240	51
123	52
1	53
106	54
130	55
33	56
30	57
133	58
172	59
32	60
14	61
113	62
106	63
65	64
153	65
195	66
110	67
97	68
126	69
37	70
71	71
193	72
255	73
187	74
191	75
83	76
155	77
31	78
114	79
61	80
25	81
96	82
247	83
212	84
171	85
159	86
18	87
118	88
288	89
31	90
67	91
197	92
181	93
134	94
27	95
66	96
22	97
179	98
294	99
179	100
118	101
2	102
23	103
55	104
68	105
95	106
125	107
160	108
273	109
8	110
36	111
252	112
50	113
13	114
177	115
149	116
231	117
165	118
83	119
82	120
121	121
69	122
60	123
175	124
211	125
51	126
180	127
283	128
296	129
178	130
167	131
176	132
125	133
100	134
139	135
117	136
90	137
199	138
170	139
96	140
251	141
74	142
75	143
257	144
242	145
77	146
183	147
261	148
151	149
56	150
87	151
84	152
262	153
101	154
244	155
20	156
93	157
87	158
128	159
210	160
35	161
19	162
265	163
153	164
11	165
227	166
27	167
201	168
131	169
150	170
4	171
103	172
34	173
43	174
168	175
161	176
259	177
127	178
86	179
241	180
222	181
157	182
100	183
122	184
105	185
55	186
33	187
220	188
23	189
111	190
124	191
75	192
189	193
63	194
208	195
46	196
175	197
140	198
199	199
21	200
162	201
264	202
142	203
173	204
56	205
51	206
225	207
111	208
82	209
52	210
94	211
48	212
187	213
172	214
291	215
116	216
186	217
102	218
36	219
250	220
108	221
229	222
7	223
76	224
196	225
40	226
104	227
12	228
80	229
22	230
4	231
134	232
177	233
151	234
162	235
72	236
35	237
239	238
194	239
198	240
234	241
7	242
8	243
109	244
85	245
3	246
183	247
136	248
236	249
122	250
38	251
184	252
26	253
107	254
138	255
102	256
17	257
209	258
258	259
20	260
113	261
142	262
132	263
68	264
230	265
120	266
140	267
191	268
215	269
150	270
267	271
25	272
141	273
16	274
18	275
67	276
129	277
146	278
91	279
163	280
158	281
148	282
193	283
26	284
57	285
73	286
49	287
237	288
13	289
224	290
297	291
69	292
197	293
6	294
84	295
281	296
219	297
98	298
128	299
109	300
5	301
190	302
276	303
228	304
92	305
263	306
245	307
167	308
91	309
37	310
138	311
72	312
249	313
181	314
98	315
34	316
143	317
97	318
156	319
178	320
194	321
74	322
214	323
41	324
206	325
46	326
9	327
99	328
47	329
143	330
28	331
19	332
268	333
28	334
171	335
168	336
160	337
213	338
300	339
78	340
54	341
147	342
32	343
88	344
260	345
112	346
216	347
43	348
149	349
180	350
185	351
58	352
188	353
62	354
9	355
89	356
146	357
63	358
59	359
284	360
243	361
275	362
45	363
15	364
266	365
61	366
196	367
95	368
202	369
195	370
145	371
105	372
159	373
271	374
277	375
85	376
174	377
200	378
1	379
86	380
285	381
24	382
170	383
152	384
11	385
232	386
226	387
101	388
53	389
107	390
282	391
21	392
103	393
71	394
141	395
161	396
298	397
132	398
223	399
198	400
93	401
66	402
144	403
246	404
79	405
126	406
238	407
217	408
190	409
164	410
157	411
42	412
58	413
42	414
40	415
135	416
90	417
48	418
54	419
154	420
189	421
77	422
137	423
248	424
123	425
44	426
5	427
192	428
279	429
129	430
154	431
50	432
124	433
182	434
256	435
139	436
30	437
152	438
133	439
119	440
147	441
207	442
137	443
254	444
49	445
173	446
39	447
169	448
163	449
166	450
131	451
192	452
65	453
186	454
108	455
10	456
156	457
233	458
148	459
184	460
200	461
3	462
155	463
287	464
76	465
185	466
272	467
169	468
120	469
70	470
280	471
269	472
218	473
64	474
16	475
295	476
135	477
45	478
188	479
253	480
174	481
286	482
116	483
73	484
80	485
29	486
81	487
29	488
121	489
290	490
205	491
182	492
144	493
64	494
59	495
119	496
2	497
117	498
41	499
\.


--
-- TOC entry 3646 (class 0 OID 16574)
-- Dependencies: 220
-- Data for Name: scam_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scam_reports (rid, uid, tid, report_loss, report_description, report_date, report_country) FROM stdin;
1	172	4	7084.35	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.	2024-08-16	Peru
2	27	4	199302.01	Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	2024-09-07	Russia
3	208	3	718298.83	Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.	2024-06-25	Botswana
4	254	2	658953.65	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	2024-10-16	South Africa
5	239	1	820572.05	Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	2024-04-14	Russia
6	210	4	968934.29	Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.	2024-05-19	China
7	45	2	248795.12	Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.	2024-04-19	China
8	127	3	853961.85	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	2025-03-17	Sweden
9	258	1	662484.93	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.	2024-05-28	Indonesia
10	126	1	710969.46	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	2024-09-16	Indonesia
11	45	3	764255.96	Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.	2024-05-23	Thailand
12	196	5	627324.52	Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.	2025-02-23	China
13	193	2	368974.52	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	2024-06-26	Ukraine
14	115	2	575903.69	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	2024-10-27	Albania
15	39	4	711445.02	Cras non velit nec nisi vulputate nonummy.	2024-12-27	Tanzania
16	14	5	187626.19	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.	2024-08-08	China
17	70	4	19455.65	Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	2025-03-19	Russia
18	81	2	507677.25	Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2024-06-03	Indonesia
19	253	4	131475.51	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.	2024-04-01	Germany
20	50	3	175785.5	Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.	2024-09-01	Greece
21	153	3	344431.66	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.	2024-11-26	Bangladesh
22	197	3	563505.96	Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2024-09-18	Mongolia
23	48	1	14614.61	Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.	2025-02-27	Russia
24	63	4	826478.64	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.	2024-11-12	Ukraine
25	194	4	999857.08	Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.	2024-11-13	Indonesia
26	186	5	623187.03	Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.	2025-01-09	China
265	121	2	179219.47	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	2024-10-27	Portugal
27	272	5	511055.83	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.	2024-07-19	South Africa
28	287	1	778126.68	Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2024-09-15	Ethiopia
29	162	3	844568.87	Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.	2025-01-08	Indonesia
30	151	4	860576.36	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-03-24	Yemen
31	121	5	541312.39	Vivamus vel nulla eget eros elementum pellentesque.	2024-08-18	Philippines
32	238	3	122270.31	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.	2024-05-31	Ukraine
33	98	5	442792.49	Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.	2024-04-16	Brazil
34	228	3	923426.11	Suspendisse potenti. Nullam porttitor lacus at turpis.	2024-07-11	China
35	201	3	851705.75	Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.	2024-09-30	Indonesia
36	86	4	941962.28	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2024-04-07	China
37	73	5	561873.78	Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.	2024-09-11	Philippines
38	8	5	169349.97	Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	2024-07-05	Sweden
39	162	1	755220.16	Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.	2024-03-30	China
40	24	5	650366.28	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.	2024-12-28	Yemen
41	285	1	921211.95	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.	2025-01-20	Brazil
42	250	3	269104.8	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.	2025-02-08	Sweden
43	195	3	880962.43	Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.	2024-11-05	Indonesia
44	174	5	773987.69	Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	2024-07-22	Zimbabwe
45	282	3	104024.71	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.	2025-03-13	Brazil
46	49	5	145855.38	Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.	2024-10-14	Canada
47	186	3	104890.35	Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	2025-01-17	Guatemala
48	164	5	815940.04	Proin eu mi.	2024-07-26	Malaysia
49	18	1	724413.26	Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.	2025-01-04	China
50	117	5	77042	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.	2024-08-21	United States
51	271	2	537846.73	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	2024-06-17	Panama
52	190	2	968731.82	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.	2025-01-06	China
53	179	1	22574.33	Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.	2024-10-19	Poland
266	185	5	293887.13	Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.	2024-11-06	Canada
54	107	2	555355.49	Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.	2024-05-26	Brazil
55	203	4	645386.3	In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2024-10-31	Malaysia
56	293	3	413986.75	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.	2024-09-21	China
57	232	3	980899.26	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2024-10-06	Brazil
58	142	3	368831.41	Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.	2024-07-07	Dominican Republic
59	139	3	588627.74	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.	2025-01-19	Czech Republic
60	130	5	251445.71	Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.	2024-09-10	Poland
61	226	3	531598.66	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.	2024-11-14	Nicaragua
62	269	5	734805.04	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.	2025-01-21	Philippines
63	112	5	53156.29	Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.	2024-04-23	Latvia
64	294	1	308285.16	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.	2024-08-22	China
65	132	3	963161.44	Proin interdum mauris non ligula pellentesque ultrices.	2024-05-25	Indonesia
66	282	4	508020.54	Vivamus in felis eu sapien cursus vestibulum.	2024-04-09	Norway
67	150	5	250713.86	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.	2024-04-07	North Korea
68	171	1	149036.2	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.	2024-05-14	Indonesia
69	86	5	263865.56	Pellentesque ultrices mattis odio. Donec vitae nisi.	2024-11-30	Mexico
70	63	4	71608.63	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.	2025-02-07	Indonesia
71	114	3	474051.4	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2025-02-18	China
72	196	3	401742.01	Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.	2025-02-23	Brazil
73	143	4	853255.7	Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.	2024-12-25	Czech Republic
74	181	3	655681.98	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.	2024-07-22	Afghanistan
75	128	2	317561.73	Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2024-08-06	Poland
76	126	1	849435.03	In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.	2024-10-20	Ukraine
77	214	2	759593.69	Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	2024-10-22	China
78	41	3	158042.86	Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.	2024-04-03	Brazil
79	11	4	224782.57	Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	2024-04-28	Canada
80	190	5	608282.25	In blandit ultrices enim.	2024-11-13	Tunisia
81	177	2	601210.92	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.	2024-11-27	South Africa
82	172	3	908212.02	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2024-08-13	Brazil
83	100	4	585764.47	Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2024-10-18	Japan
84	155	5	954017.48	Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.	2025-02-24	Uganda
85	113	3	223447.74	Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	2024-05-06	Russia
86	151	4	664257.41	Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.	2024-12-19	Canada
87	115	2	993829.75	Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.	2024-05-26	France
88	226	4	382618.87	Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.	2024-10-17	China
89	295	2	215386.96	In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.	2024-11-09	China
90	123	4	853777.05	Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	2024-05-13	United States
91	265	4	818506.43	Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2024-08-11	Namibia
92	7	1	871782.08	Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.	2024-10-03	Macedonia
93	82	3	193690.86	Aliquam sit amet diam in magna bibendum imperdiet.	2024-08-22	Philippines
94	28	1	336827.46	Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.	2025-02-20	New Zealand
95	82	3	498554.71	Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	2024-05-06	Cuba
96	202	1	410393.94	Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.	2024-08-23	Canada
97	193	2	166427.97	In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-08-13	Ukraine
98	193	3	999246.3	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.	2024-09-25	Serbia
99	38	2	418244.88	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	2024-07-18	Luxembourg
100	206	1	691836.57	Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	2024-05-19	Mexico
101	117	2	419578.59	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.	2024-12-14	China
102	192	1	997888.57	Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	2025-01-17	China
103	19	1	210240.53	Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.	2024-08-25	China
104	56	2	421495.64	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.	2024-08-28	China
105	76	4	813481.24	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.	2024-12-20	China
106	9	4	81789.26	Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.	2025-01-30	Tanzania
107	220	3	596197.28	Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.	2024-04-16	Mexico
108	271	1	567482.24	Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	2024-07-20	China
109	231	2	49768.72	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.	2024-08-10	Peru
110	162	2	738389.95	Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	2024-07-31	Canada
111	228	5	27822.08	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.	2025-02-17	Russia
112	65	1	823156.44	Morbi porttitor lorem id ligula.	2024-10-31	Sweden
113	190	3	28793.73	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	2024-05-08	Russia
114	300	2	81772.95	Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	2024-11-25	Russia
115	121	2	144791.09	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	2025-01-22	Portugal
116	185	3	850267.83	Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	2024-11-24	Greece
117	294	2	611948.73	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.	2025-01-15	Luxembourg
118	84	2	685143.72	Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2025-02-05	China
119	230	2	108489.67	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.	2024-06-08	China
120	220	4	44433.73	Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	2024-04-17	China
121	35	2	218694.8	Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.	2024-05-23	China
122	228	5	662746.64	Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.	2025-01-17	China
123	205	1	393347.48	Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.	2024-09-30	Indonesia
124	259	5	710233.64	Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	2024-11-07	Indonesia
125	10	5	94062.22	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	2025-01-23	Argentina
126	221	5	496890.1	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.	2025-02-25	Russia
127	55	2	19392.49	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.	2024-12-15	Peru
128	30	2	850890.53	Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.	2024-11-24	Russia
129	291	4	659283.52	Suspendisse potenti. Nullam porttitor lacus at turpis.	2025-01-22	Indonesia
130	95	4	536306.77	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.	2024-05-02	Russia
131	213	3	993843.54	In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.	2024-07-19	Czech Republic
267	98	5	992430.99	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	2025-03-06	Mongolia
132	293	4	559600.81	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.	2024-04-05	Kazakhstan
133	3	1	847105.09	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	2025-02-23	Russia
134	245	4	498284.26	Aenean fermentum.	2024-08-18	Tunisia
135	285	2	81543.27	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	2024-06-18	China
136	238	4	489543.69	Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.	2025-01-19	Kazakhstan
137	68	2	385133.14	Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	2024-08-20	Russia
138	175	4	331217.25	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.	2024-04-27	Indonesia
139	218	4	998696.56	Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.	2024-07-27	Iraq
140	285	3	681624.15	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.	2025-02-11	Philippines
141	204	1	237587.57	Morbi porttitor lorem id ligula.	2024-10-27	Ukraine
142	27	3	564786.36	Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.	2024-05-20	Greece
143	16	4	824168.19	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.	2024-11-14	Argentina
144	69	1	972944.68	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.	2025-01-18	Botswana
145	150	3	852328.81	In sagittis dui vel nisl. Duis ac nibh.	2024-09-24	China
146	96	1	791118.2	In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	2024-06-03	China
147	203	4	112491.3	Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.	2024-05-19	Philippines
148	282	4	453368.41	In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.	2024-05-27	United States
149	75	2	39279.99	Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.	2024-06-11	Indonesia
150	271	3	681750.92	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2024-09-27	Portugal
151	221	1	927091.01	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2024-07-11	Serbia
152	91	3	65086.41	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.	2025-01-15	China
153	242	5	933550.99	Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	2025-01-29	New Zealand
154	5	4	760204.81	Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2024-12-31	Pakistan
155	283	3	401896.45	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.	2024-06-17	Indonesia
156	66	4	824791.33	Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.	2025-03-09	Argentina
157	133	4	592382.48	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.	2024-10-29	Brazil
158	165	1	439694.75	Donec dapibus. Duis at velit eu est congue elementum.	2025-03-12	China
159	133	4	288318.39	Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	2025-02-26	Ukraine
160	49	4	994670.87	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.	2024-11-18	China
161	285	5	480946.5	Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	2024-05-16	France
162	36	5	912925.53	Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2025-02-08	Belarus
163	33	5	874504.39	Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.	2024-09-16	United States
164	158	5	79203.87	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.	2024-06-07	China
165	227	3	306754.74	In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.	2025-02-22	China
166	45	4	668769.61	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	2024-10-13	Sweden
167	69	1	165270.93	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	2024-08-25	Greece
168	46	2	923129.79	Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	2024-06-26	Indonesia
169	222	3	618352.74	Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.	2024-11-12	China
170	25	2	284473.97	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	2024-04-10	Morocco
171	281	3	922994.22	Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.	2024-07-30	Norway
172	282	1	354768.71	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	2024-11-09	Indonesia
173	159	1	134440.31	Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.	2024-05-24	Ukraine
174	225	3	459445.72	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	2024-08-08	Sweden
175	225	5	128237.26	Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	2024-12-21	Poland
176	4	4	24389.45	Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.	2024-07-11	China
177	168	1	812615.59	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.	2025-01-15	China
178	27	3	27440.53	Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.	2024-05-03	Poland
179	7	3	432445.08	In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-10-21	China
180	166	2	814660.53	Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	2025-03-15	Brazil
181	6	4	883715.71	Nulla tellus. In sagittis dui vel nisl.	2025-01-29	Brazil
182	107	2	66000.66	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.	2025-01-10	Indonesia
183	181	2	709613.03	Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.	2025-03-09	Peru
184	152	5	538341.71	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	2024-04-29	Palestinian Territory
185	245	5	180990.37	Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.	2024-07-24	Yemen
186	40	5	763801.79	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2025-02-15	Dominican Republic
187	26	3	24622.6	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.	2024-09-09	Philippines
188	120	5	619704.64	Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.	2025-02-26	Czech Republic
189	202	3	343815.29	In eleifend quam a odio. In hac habitasse platea dictumst.	2024-05-12	China
190	114	3	172666.14	Duis mattis egestas metus. Aenean fermentum.	2024-09-25	Serbia
191	293	5	240280.99	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.	2025-01-31	China
192	53	3	769720.68	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.	2024-06-05	Japan
193	254	3	258071.9	Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.	2024-05-12	China
194	123	4	705.37	Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.	2024-12-14	Philippines
195	152	3	495219.49	Proin risus.	2025-01-23	Japan
196	290	1	300703.11	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.	2024-12-13	Tanzania
197	198	4	696014.99	Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.	2024-09-23	China
198	189	1	9552.64	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.	2024-12-04	China
199	9	2	566938.57	In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.	2024-04-29	Russia
200	73	1	272978.51	Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	2025-01-29	Thailand
201	138	5	132486.91	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-09-01	Philippines
202	214	1	689733.72	In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.	2024-09-20	China
203	184	2	550042.99	Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	2024-07-28	Azerbaijan
204	113	2	681174.56	Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.	2024-07-24	Indonesia
205	121	2	270623.9	Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	2025-03-07	Bulgaria
206	200	4	685856.38	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2024-08-04	China
207	109	3	912216.11	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.	2024-06-27	Uzbekistan
208	113	5	350338.49	Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.	2025-01-23	Iran
209	111	5	64608.47	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.	2024-05-12	Portugal
210	297	5	688188.66	Mauris lacinia sapien quis libero.	2025-01-21	Indonesia
211	160	2	301728.57	Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.	2024-07-28	Russia
212	90	3	809854.13	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.	2024-07-21	Thailand
213	55	3	766574.96	Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.	2024-06-06	Russia
214	295	1	980099.48	In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.	2024-11-20	China
215	134	1	518678.61	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	2025-03-05	Canada
216	126	1	874049.89	Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.	2025-01-27	Indonesia
217	276	3	161217.18	Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	2024-07-31	China
218	4	5	383441.68	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	2025-01-05	Serbia
219	78	5	232295.92	Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.	2025-01-24	Mexico
220	230	4	874244.88	Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.	2024-04-27	Vanuatu
221	105	5	909800.37	Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	2024-04-26	Venezuela
222	91	2	799671.14	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.	2024-09-16	Japan
223	83	3	858879.57	Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.	2025-01-14	Pakistan
224	152	4	19619.29	Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.	2024-11-04	Peru
225	1	3	485768.62	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2024-07-30	France
226	271	5	637746.85	Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	2024-11-15	Portugal
227	43	4	818490.36	Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	2024-10-20	Indonesia
228	103	3	826214.96	Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.	2024-12-04	Indonesia
229	115	1	479796.06	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.	2024-05-06	Slovenia
230	276	2	659923.14	Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.	2024-04-16	Sweden
231	115	5	261984.85	Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	2024-10-24	Bangladesh
232	15	4	990924.44	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.	2025-03-09	United States
233	222	3	321506.75	Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.	2024-08-27	Morocco
234	233	3	118055.17	Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2024-10-15	Poland
235	250	2	866301.9	Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	2024-12-27	Russia
236	224	1	369578.14	Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.	2024-03-23	Mexico
237	105	5	854299.17	Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	2024-03-27	China
238	288	3	855583.07	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2025-03-18	Canada
239	95	4	683371.41	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.	2024-05-09	Indonesia
240	47	4	406747.7	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.	2024-07-06	Chile
241	130	4	568503.81	Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.	2024-11-04	Japan
242	200	4	667629.95	Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	2024-09-23	Japan
243	291	4	691572.3	Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	2024-10-31	Indonesia
244	55	1	950470.09	Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2025-03-13	South Africa
245	293	3	434468.84	Fusce consequat. Nulla nisl. Nunc nisl.	2024-06-02	Honduras
246	126	4	997833.69	Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.	2024-06-28	Paraguay
247	140	3	679451.99	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.	2024-07-05	Netherlands
248	192	1	617315.75	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	2024-05-23	Indonesia
249	161	4	70687.76	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2024-11-11	Greece
250	95	2	117825.44	Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.	2024-11-26	China
251	62	2	831362.05	Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	2024-11-08	Japan
252	262	4	937910.9	Phasellus in felis. Donec semper sapien a libero.	2024-11-23	Poland
253	66	3	43064.88	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.	2025-01-27	Portugal
254	90	3	991557.31	Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2025-02-07	Thailand
255	266	2	725663.25	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.	2025-03-05	China
256	191	3	771544.78	In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	2024-06-30	Peru
257	113	1	360787.61	Nullam varius. Nulla facilisi.	2024-07-17	Portugal
258	197	3	333388.44	Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.	2024-08-08	Philippines
259	235	2	100992.59	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.	2024-04-19	China
260	31	2	962670.55	In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.	2025-03-14	Mauritius
261	284	4	950240.61	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.	2024-06-27	France
262	164	4	841644.95	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	2024-03-27	Egypt
263	155	1	141299.14	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	2024-07-13	Netherlands
264	233	3	55658.96	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.	2024-12-12	Lithuania
268	12	4	883284.63	Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.	2024-07-12	Nigeria
269	188	4	214360.61	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.	2025-02-17	Indonesia
270	44	3	325198.37	Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.	2024-06-16	Brazil
271	191	1	553698.12	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.	2024-04-01	Indonesia
272	200	3	397518.64	Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	2024-06-30	Russia
273	58	3	931165.96	Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	2025-02-15	United States
274	297	5	843149.67	Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.	2024-05-18	Indonesia
275	162	5	922418.15	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-11-22	China
276	69	1	715360.11	Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2024-10-08	Tunisia
277	21	4	252801.7	Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.	2024-08-25	China
278	154	5	315003.05	Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2024-09-28	Poland
279	82	3	835227.07	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-10-29	China
280	147	2	601009.05	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.	2024-05-05	Mexico
281	142	4	110620.95	Morbi a ipsum. Integer a nibh. In quis justo.	2025-01-18	Portugal
282	284	5	87801.52	Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.	2024-08-29	Serbia
283	183	3	913023.15	Nunc nisl.	2024-07-12	China
284	265	5	233949.82	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.	2024-04-05	Indonesia
285	57	2	174765.99	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.	2024-06-28	Argentina
286	278	4	360899.98	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.	2024-05-20	Costa Rica
287	178	1	413413.96	Nulla mollis molestie lorem.	2024-04-27	Sweden
288	275	5	226618.95	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2024-04-10	Venezuela
289	295	1	343568.35	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2024-10-28	China
290	54	4	692536.59	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.	2024-07-04	New Zealand
291	253	1	180406.2	Morbi ut odio.	2025-01-08	Mexico
292	143	1	577258.75	Proin risus.	2024-04-20	Brazil
293	166	3	535581.64	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.	2024-06-02	China
294	108	2	285162.49	Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.	2024-09-01	Indonesia
295	52	2	190014.98	Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.	2025-01-18	Ukraine
296	221	5	810810.04	Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.	2025-03-15	Ukraine
297	96	2	330755.02	Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.	2024-08-26	Iran
298	281	1	864130.27	In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.	2024-10-29	China
299	100	2	77014.03	Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.	2024-11-09	Poland
300	245	2	285814.55	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	2024-05-11	France
301	211	2	501711.38	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	2025-02-06	Russia
302	70	4	40680.75	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	2024-07-16	Indonesia
303	217	1	408748.32	Praesent blandit. Nam nulla.	2024-06-05	Armenia
304	8	1	252808.77	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.	2024-06-03	Poland
305	2	2	360392.07	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	2024-10-31	Russia
306	29	5	951077.73	Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.	2025-01-25	Peru
307	63	3	666980.59	Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.	2024-06-11	Indonesia
308	116	5	798779.1	Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	2025-01-13	Greece
309	109	3	868171.94	Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.	2024-12-08	China
310	246	3	647513.52	Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.	2024-06-18	China
311	202	4	344868.54	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.	2024-09-21	Portugal
312	183	4	616056.72	Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.	2024-05-22	China
313	236	2	12574.66	Vivamus vestibulum sagittis sapien.	2024-07-22	Botswana
314	184	1	310851.01	In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.	2024-05-29	China
315	215	2	59485.67	Phasellus sit amet erat. Nulla tempus.	2024-07-15	Philippines
316	230	4	521870.14	Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.	2024-07-13	Portugal
317	2	2	493483.42	Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.	2025-03-09	Tunisia
318	288	3	318921.14	Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.	2024-12-31	Brazil
319	203	2	359926.59	Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.	2025-02-16	China
320	243	5	443212.04	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	2024-11-21	Mongolia
321	79	2	754810.45	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	2024-08-07	France
322	56	1	23525.97	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.	2024-05-01	China
323	204	4	581329.14	Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2025-01-02	Colombia
324	269	4	175432.48	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	2024-11-20	Ukraine
325	12	1	664182.13	Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.	2024-04-10	Czech Republic
326	75	5	575896.81	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	2024-07-13	Ukraine
327	244	2	523713.71	Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.	2024-04-15	Indonesia
328	19	3	921238.36	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	2025-01-06	Tunisia
329	141	5	627338.05	Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	2024-03-24	United States
330	100	3	705897.25	Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2024-05-29	Greece
331	212	1	162857.22	Aliquam erat volutpat. In congue. Etiam justo.	2024-07-09	Russia
332	36	2	870.18	Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2025-02-08	Philippines
333	175	2	569745.62	Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.	2024-10-19	Philippines
334	279	2	295916.85	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.	2024-05-20	China
335	192	4	661607	Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.	2025-02-19	Indonesia
336	71	2	883468.38	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.	2024-09-27	Saint Pierre and Miquelon
337	101	2	970254.26	Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	2024-11-17	Indonesia
338	200	5	645411.89	Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.	2025-03-19	Russia
339	209	5	913230.8	Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2024-12-06	China
340	299	3	690498.45	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.	2025-01-29	China
341	255	2	298075.93	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.	2024-04-10	Nigeria
342	16	5	485552.13	Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.	2025-03-03	Portugal
343	240	4	300837.64	Donec vitae nisi.	2024-08-15	Russia
344	234	5	279963.65	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.	2024-06-08	Japan
345	64	4	376229.37	Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2024-04-29	United States
346	147	3	299135.73	Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.	2024-06-16	South Korea
347	9	5	952920.76	Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.	2024-11-23	Indonesia
348	113	4	278474.58	Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.	2024-11-21	Portugal
349	31	5	510059.1	Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	2024-10-06	Russia
350	8	3	456875.79	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.	2024-06-14	China
351	284	4	121937.28	Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.	2024-08-31	Sierra Leone
352	288	2	235159.54	Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.	2024-04-02	Greece
353	26	3	225657.67	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2024-05-10	Portugal
354	254	2	700522.22	Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.	2024-07-11	Indonesia
355	163	5	190794.05	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.	2025-01-21	China
356	266	1	642009.2	In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	2024-10-27	China
357	56	2	253982.05	Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	2024-11-23	Russia
358	274	2	642687.42	Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.	2024-06-22	Sweden
359	240	4	989962.69	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	2024-06-10	China
360	228	5	66330.06	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.	2025-01-19	Peru
361	296	1	680079.14	Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.	2025-01-15	Portugal
362	87	1	205044.42	Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.	2025-01-20	Ukraine
363	196	3	517204	In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.	2024-04-11	Nigeria
364	57	5	491391.31	Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2025-03-13	Ivory Coast
365	281	4	483014.73	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.	2025-01-05	Peru
366	53	3	212913.22	Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.	2024-09-22	Russia
367	236	5	82163.06	Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.	2025-01-12	Jordan
368	231	4	534447.05	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.	2024-05-26	Portugal
369	236	5	299368.09	Aenean sit amet justo. Morbi ut odio.	2024-04-14	Latvia
370	26	1	473492.95	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	2024-08-20	France
371	283	3	383694.31	Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.	2024-04-11	Japan
372	298	1	356016.36	Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.	2024-04-27	China
373	54	3	431659.79	Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	2024-03-29	Indonesia
374	149	3	739953.48	Ut tellus.	2024-11-05	Pakistan
375	190	2	967143.88	Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.	2024-06-27	China
376	237	5	599678.52	Vivamus tortor.	2024-08-01	Portugal
377	25	2	131359.57	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-12-25	Indonesia
378	189	5	255.93	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	2024-04-27	Philippines
379	161	2	648512.5	Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	2024-12-18	South Africa
380	13	3	330167.45	Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.	2025-02-19	Indonesia
381	44	3	455959.08	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	2024-10-20	United States
382	244	3	57133.48	Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.	2024-12-22	Ethiopia
383	60	4	867166.81	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2025-03-06	Japan
384	12	4	423506.35	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	2024-07-25	Bangladesh
385	23	2	845238.95	In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.	2024-12-19	Indonesia
386	256	1	212043.56	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2024-05-24	Azerbaijan
387	160	4	995585.11	In quis justo.	2024-06-04	Luxembourg
388	136	1	973452.09	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	2024-07-15	China
389	128	1	572340.65	Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.	2025-02-06	Russia
390	187	2	913727.46	Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.	2025-03-19	Poland
391	3	5	926097	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.	2024-04-19	United States
392	4	2	618817.85	Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.	2024-10-18	Poland
393	26	1	899415.55	Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.	2024-12-02	Thailand
394	96	4	724840.04	Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.	2024-08-31	Indonesia
395	57	2	612936.52	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.	2024-08-10	Ivory Coast
396	34	4	861312.32	Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	2024-08-21	Portugal
397	137	3	743961.68	Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.	2024-09-25	Moldova
398	218	2	51691	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	2024-12-26	China
399	283	3	765082.6	In eleifend quam a odio. In hac habitasse platea dictumst.	2024-12-25	Philippines
400	138	1	830788.59	Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	2024-06-25	Philippines
401	188	5	484073.24	Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.	2024-12-22	Poland
402	251	1	574365.95	Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.	2024-09-19	Indonesia
403	84	1	512061.16	Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-05-29	Indonesia
404	293	1	868090.93	Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.	2024-06-27	China
405	295	5	998200.54	Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.	2024-10-17	Peru
406	169	2	496329.89	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.	2024-06-08	Italy
407	29	2	675871.69	Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	2024-12-23	United States
408	196	3	378546.17	Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	2024-07-14	Indonesia
409	278	3	932851.05	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	2025-02-14	Indonesia
410	104	5	452078.91	Aliquam erat volutpat.	2024-10-23	Brazil
411	96	1	463147.31	Morbi porttitor lorem id ligula.	2025-01-03	Slovenia
412	235	1	982449.43	In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2025-02-25	Nigeria
413	100	2	343615.3	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.	2024-06-14	China
414	137	2	77297.02	Nam dui.	2025-02-16	France
415	81	2	895255.91	Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	2025-03-13	Greece
416	92	5	852098.84	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.	2024-05-28	Mexico
417	75	2	955124.48	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	2025-01-09	Japan
418	46	5	932869.65	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.	2025-03-03	Mexico
419	256	4	144149.23	Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	2024-11-24	Peru
420	240	4	585703.1	In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.	2024-09-03	Greece
421	110	1	392156.97	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.	2025-03-12	Denmark
422	219	5	640456.26	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	2024-08-06	Russia
423	113	3	36849.73	Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.	2024-07-11	Russia
424	46	3	650142.72	Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.	2024-06-29	China
425	220	1	949368.09	Nulla mollis molestie lorem. Quisque ut erat.	2024-09-14	China
426	116	5	650708.77	Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.	2025-02-17	South Africa
427	129	4	302645.24	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.	2024-10-27	Syria
428	265	2	398212.23	Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.	2025-03-10	China
429	114	1	54283.65	In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	2024-05-09	Philippines
430	288	3	19882.12	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2024-12-23	Poland
431	183	3	788346	Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.	2024-10-12	Curacao
432	81	2	97447.84	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.	2024-07-04	Dominican Republic
433	59	1	615473.1	Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2025-03-18	Mongolia
434	118	2	965714.64	Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.	2024-08-31	Syria
435	264	3	253506.9	Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.	2024-07-05	Paraguay
436	282	5	596531.7	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.	2025-02-18	Ukraine
437	251	3	629602.1	Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	2024-07-13	Portugal
438	121	5	558261.24	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.	2024-04-24	Tunisia
439	47	3	237438.39	Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	2024-09-05	China
440	76	4	651849.85	Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.	2024-11-10	Poland
441	59	2	173805.04	Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.	2024-04-20	France
442	175	4	462665.13	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.	2025-01-25	Philippines
443	166	3	546242.62	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.	2024-11-28	Pakistan
444	119	1	79220	Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.	2024-04-14	China
445	121	2	315307.38	Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	2024-09-16	Indonesia
446	15	4	225570.46	Duis consequat dui nec nisi volutpat eleifend.	2024-07-08	United States
447	201	1	370430.26	Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	2024-07-18	Philippines
448	274	4	175204.22	Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.	2024-12-13	France
449	218	5	986463.05	Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	2024-12-10	Canada
450	36	1	409351.93	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.	2025-03-06	China
451	130	4	825299.13	Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.	2024-05-14	Indonesia
452	263	3	965784.58	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.	2024-04-19	Poland
453	297	5	281431.22	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	2024-07-12	China
454	127	2	477061.62	Donec semper sapien a libero. Nam dui.	2024-05-10	China
455	102	1	726057.71	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.	2024-07-22	Indonesia
456	39	2	581551.11	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	2025-03-08	Greece
457	199	1	947944.65	Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	2025-03-10	Philippines
458	207	2	580030.99	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	2024-08-05	Thailand
459	26	5	131037.88	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.	2024-07-17	China
460	135	4	776199.57	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.	2024-05-24	Indonesia
461	247	5	849124.72	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.	2024-12-06	China
462	31	3	524983.43	Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.	2024-11-14	China
463	93	2	147415.04	Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.	2025-01-08	Russia
464	124	2	622496.43	Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.	2025-03-03	Philippines
465	260	4	17496.7	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.	2024-06-23	Indonesia
466	116	3	196099.64	Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.	2024-09-17	Philippines
467	257	3	511501.1	Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	2024-07-17	Norway
468	198	3	393526.47	Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.	2025-03-11	Taiwan
469	109	2	947149.39	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.	2024-07-23	Hungary
470	92	4	454007.68	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.	2024-12-20	Zimbabwe
471	161	2	499697.74	In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.	2024-04-15	Portugal
472	142	4	222102.6	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.	2024-09-02	Peru
473	202	4	558938.15	Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	2024-12-06	Guatemala
474	167	1	836955.97	Fusce posuere felis sed lacus.	2024-09-27	China
475	133	4	893457.83	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.	2025-01-03	Mexico
476	40	4	902834.88	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.	2024-04-19	Sweden
477	228	2	395626.02	Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.	2024-08-18	Russia
478	291	2	75424.49	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2024-03-29	Russia
479	102	2	909707.95	Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.	2024-05-03	Ireland
480	37	4	780484.1	Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	2024-04-28	Pakistan
481	176	2	165118.19	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.	2024-06-05	France
482	108	3	725731.73	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.	2025-01-07	Peru
483	294	2	841311.62	Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.	2024-08-04	Portugal
484	94	3	73028.2	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.	2024-08-06	France
485	74	2	173190.23	In quis justo.	2024-03-27	Ukraine
486	191	3	770594.68	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.	2024-06-25	Indonesia
487	173	1	50809.99	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.	2024-07-12	China
488	163	5	546289.75	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.	2025-01-01	Iran
489	22	4	323700.54	Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	2024-10-05	Indonesia
490	227	1	820148.71	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	2024-04-08	Colombia
491	182	5	39284.18	Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.	2024-05-18	China
492	247	1	211449.06	Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.	2024-08-23	Uganda
493	262	1	951323.48	Nam nulla.	2024-12-17	China
494	275	4	718430.07	Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	2024-07-12	Argentina
495	293	4	816720.94	Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.	2024-11-24	Indonesia
496	184	3	177355.48	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.	2025-02-01	Yemen
497	56	2	451786.43	Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.	2024-09-20	Indonesia
498	53	4	377967.37	Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	2024-06-24	China
499	53	5	217097.15	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.	2024-05-02	Indonesia
501	201	3	1000	abc xyz	2025-03-22	India
502	309	1	123454321	wertyuio	2025-04-03	USA
503	311	1	1234	spdfrgndg	2025-05-09	USA
505	316	1	20000	I lost money	2025-05-02	India
506	302	1	1234	qwertyh	2025-05-03	USA
507	302	1	123456	qazxdsw	2025-05-10	USA
508	319	1	1234589	qasxdfgh	2025-04-30	Japan
\.


--
-- TOC entry 3647 (class 0 OID 16589)
-- Dependencies: 221
-- Data for Name: scam_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scam_sources (sid, source_type, source_name) FROM stdin;
1	Website	www.oesxodun.io
2	Twitter	@hu7dv5cj
3	Phone	907-516-8932
4	Instagram	@z7fu9izt
5	Phone	972-221-7065
6	Phone	305-473-9072
7	Website	www.vfflkkku.io
8	Website	www.syloiilj.com
9	Instagram	@sqbw82bo
10	Email	ibdkqafk@mailinator.com
11	Instagram	@8xkcmk29
12	Phone	151-133-4863
13	Facebook	@wrneix8x
14	Email	tvelvbs5@mailinator.com
15	Email	z6vxry1w@mailinator.com
16	Phone	352-952-1347
17	Phone	479-537-4403
18	Twitter	@2s9a4qtj
19	Website	www.nqrvrgpj.com
20	Phone	294-483-4350
21	Facebook	@cv0ioigp
22	Email	5x3uiliy@fakemail.org
23	Website	www.dhhlllmf.com
24	Phone	535-100-1042
25	Facebook	@26efal1t
26	Email	f95dsr5h@example.com
27	Email	lh632zsw@fakemail.org
28	Email	g4ocm8u4@testmail.com
29	Email	q8nf9gdu@testmail.com
30	Email	u49ppsja@example.com
31	Instagram	@fpuzodzg
32	Website	www.efzdpyil.org
33	Email	36vezzqu@mailinator.com
34	Email	rwqaizix@testmail.com
35	Facebook	@zgotm4tf
36	Phone	203-231-4346
37	Email	yb96e4qe@example.com
38	Instagram	@k00cxns7
39	Phone	230-716-7315
40	Website	www.oqhxawwy.com
41	Phone	135-362-9646
42	Phone	975-374-8228
43	Phone	284-434-3401
44	Twitter	@bwjdw8jc
45	Website	www.zxcikshr.org
46	Website	www.xsqznujk.org
47	Website	www.woagyhge.net
48	Website	www.hhtplzpp.net
49	Website	www.vkutzdpu.org
50	Phone	816-443-6164
51	Website	www.tromhrdc.org
52	Phone	407-453-2363
53	Website	www.ntxtychk.com
54	Facebook	@y3f7j9kw
55	Instagram	@85x10y51
56	Twitter	@g15yirwa
57	Email	d396d33b@fakemail.org
58	Website	www.rfuvormf.org
59	Phone	222-321-8860
60	Phone	878-178-9035
61	Phone	699-768-4726
62	Email	15jjf7ek@mailinator.com
63	Phone	170-339-4327
64	Facebook	@gzmzncnk
65	Phone	806-818-6903
66	Phone	410-989-9373
67	Instagram	@6qew0oii
68	Instagram	@jngcl1x7
69	Email	5pvl2dfa@fakemail.org
70	Phone	221-346-6454
71	Website	www.mnhscyxr.org
72	Phone	147-620-8072
73	Instagram	@4vrcvkv3
74	Instagram	@wd7ldc63
75	Website	www.vdnqricc.net
76	Instagram	@v7gus3nu
77	Website	www.nqctijjy.net
78	Email	ee8w17ez@fakemail.org
79	Phone	854-510-4742
80	Instagram	@dw8sufsi
81	Twitter	@lmrvmb4q
82	Phone	417-315-2808
83	Website	www.tltctefr.io
84	Website	www.xjnkftbc.net
85	Twitter	@153gd9ui
86	Phone	524-397-3028
87	Phone	444-189-2332
88	Instagram	@pw2xvjpc
89	Facebook	@x2aew337
90	Facebook	@9sj3w24h
91	Twitter	@lostembl
92	Email	7eof88dh@testmail.com
93	Website	www.wlvcvclu.org
94	Facebook	@840m5vdj
95	Email	pypqyfa5@fakemail.org
96	Website	www.egdufnrs.com
97	Website	www.kutvipsw.net
98	Phone	957-517-2328
99	Instagram	@vyyxwq56
100	Phone	732-709-3043
101	Facebook	@3qskk059
102	Instagram	@xt8mtjs5
103	Twitter	@w8hynyya
104	Email	foixrg1n@fakemail.org
105	Instagram	@5kryf1x5
106	Website	www.ugwjfufs.com
107	Website	www.osfglqrp.org
108	Twitter	@nsmqc2t5
109	Email	e33hj78p@fakemail.org
110	Email	m0chus34@fakemail.org
111	Facebook	@pq8k7lie
112	Facebook	@88bw2el9
113	Email	5297p9iv@fakemail.org
114	Instagram	@al4yd0r6
115	Twitter	@bb3q03dh
116	Email	rnsva9zf@example.com
117	Email	5lfmfx5h@example.com
118	Phone	511-724-9644
119	Website	www.oovfkkxf.io
120	Phone	514-566-4438
121	Phone	348-763-5089
122	Email	q14v1cby@mailinator.com
123	Phone	892-679-6304
124	Email	yq15qhxs@example.com
125	Phone	336-769-5006
126	Twitter	@2u90vy11
127	Website	www.nnomsajb.net
128	Facebook	@kmxj9kfl
129	Email	97qdxwp6@example.com
130	Facebook	@swt3bod2
131	Facebook	@h7dvn191
132	Website	www.aibkcrja.io
133	Website	www.gbxpcoiu.org
134	Twitter	@927pbd1n
135	Website	www.ibgovjju.org
136	Phone	649-403-8394
137	Email	w73eh9d3@example.com
138	Phone	714-500-8243
139	Phone	487-971-8516
140	Twitter	@sf1jusun
141	Phone	369-261-4262
142	Website	www.oxdjwqyh.net
143	Email	retnu1zx@mailinator.com
144	Website	www.hzrixihl.io
145	Website	www.doifujbr.com
146	Phone	232-390-5704
147	Website	www.dqtgjwzl.org
148	Website	www.tcwpgdtq.com
149	Email	d53hz2cl@mailinator.com
150	Twitter	@lx3qoaw5
151	Twitter	@ilg5o1lb
152	Phone	902-723-5350
153	Phone	426-314-3575
154	Phone	630-261-8118
155	Email	nez394jx@example.com
156	Email	yb1qxuom@example.com
157	Website	www.nryykxkf.net
158	Instagram	@btvr1lka
159	Website	www.fvzkhvcc.net
160	Email	lzh0jmlc@mailinator.com
161	Phone	763-490-4433
162	Website	www.efrpdxop.com
163	Phone	927-901-8740
164	Facebook	@5opde0xg
165	Instagram	@xza9x6zg
166	Website	www.gvurssuf.com
167	Email	3rfgzhhh@testmail.com
168	Website	www.yxsswhvu.com
169	Phone	894-496-7385
170	Website	www.ycoccgoh.io
171	Instagram	@zmgh95xp
172	Phone	620-687-5038
173	Website	www.lejxflya.com
174	Phone	944-267-1014
175	Twitter	@rbqr0v29
176	Phone	596-553-2631
177	Instagram	@v4uikj1b
178	Phone	788-875-3264
179	Phone	561-503-2019
180	Website	www.pnoecydp.com
181	Website	www.tftrepdw.io
182	Email	wjpyf04t@example.com
183	Website	www.nljjymzn.net
184	Phone	789-338-1429
185	Website	www.vvkprqfw.com
186	Website	www.zbzxeewl.com
187	Phone	753-826-8965
188	Instagram	@a5cx4z1i
189	Email	abjtv91i@fakemail.org
190	Phone	231-985-9626
191	Facebook	@hd8v253u
192	Email	elx8z8oc@fakemail.org
193	Phone	475-828-1204
194	Email	5y6aqsnl@testmail.com
195	Website	www.yefkqgio.net
196	Instagram	@eks70j9h
197	Email	lzgd8mwq@fakemail.org
198	Twitter	@clki3aqi
199	Email	rku0qbf5@mailinator.com
200	Email	53xibwai@example.com
201	Phone	824-788-9382
202	Phone	268-729-9407
203	Email	bdrltfux@fakemail.org
204	Phone	346-912-2363
205	Email	m5ndr6m0@mailinator.com
206	Instagram	@6c89vym9
207	Email	k5h3bqgm@testmail.com
208	Facebook	@qraeqit1
209	Website	www.loeldbaa.org
210	Twitter	@ddniyw41
211	Website	www.nxnuxvnu.io
212	Twitter	@xtv9512n
213	Twitter	@5hxl6t2e
214	Twitter	@r0u4ex64
215	Website	www.wrcdtshc.org
216	Email	b1jfs29d@example.com
217	Email	keaiaxju@testmail.com
218	Phone	230-622-8377
219	Email	tww0qsl6@testmail.com
220	Website	www.isgvrpsz.io
221	Phone	466-183-7389
222	Phone	543-486-1475
223	Twitter	@gba2jw7m
224	Website	www.ezypcwcq.io
225	Phone	582-218-1814
226	Phone	493-630-1846
227	Website	www.oubyryeh.io
228	Website	www.dsmrtazo.org
229	Instagram	@9cubhuua
230	Email	y55z5gt7@example.com
231	Email	pnhzqs8o@example.com
232	Email	esli9us3@fakemail.org
233	Email	uhlr9ywo@testmail.com
234	Website	www.ecxbpgag.net
235	Website	www.pwmvnzvh.org
236	Phone	631-104-2188
237	Website	www.mkmtsyfa.net
238	Website	www.jrdsbzyq.io
239	Email	xdrtjcue@example.com
240	Website	www.jyshmhfk.io
241	Email	zpoi4zle@testmail.com
242	Phone	437-584-4567
243	Phone	112-955-1729
244	Phone	539-697-3962
245	Website	www.tcnkpajt.io
246	Website	www.ggnwevlu.com
247	Website	www.sngznwtr.net
248	Twitter	@4y3mityb
249	Phone	303-202-7577
250	Phone	204-235-1029
251	Phone	572-368-2866
252	Phone	415-123-3876
253	Phone	237-351-7256
254	Twitter	@1tig3ib3
255	Website	www.akymunrm.net
256	Phone	670-909-3891
257	Email	9hvjkhbj@mailinator.com
258	Website	www.usdtctqg.io
259	Phone	331-128-5465
260	Website	www.hzmfygzd.io
261	Website	www.hjixjbne.io
262	Twitter	@3zbz1siv
263	Email	tsw9ybtw@testmail.com
264	Email	j4drh4bu@testmail.com
265	Website	www.goneaqov.io
266	Twitter	@mxalt89o
267	Facebook	@xy3nypkq
268	Email	5pmx1lw8@mailinator.com
269	Phone	325-393-9772
270	Phone	352-890-4548
271	Instagram	@ogijxhvb
272	Website	www.iukymdvi.net
273	Facebook	@lj6pw75w
274	Email	4a9sue2s@fakemail.org
275	Website	www.mkzfttwr.org
276	Twitter	@cvinln0f
277	Website	www.gigmyagv.io
278	Phone	882-392-7168
279	Phone	193-209-3800
280	Website	www.wparpmue.net
281	Email	mlkvtb6i@testmail.com
282	Email	t5ynae4i@fakemail.org
283	Phone	205-680-3978
284	Website	www.namvzlcy.net
285	Phone	193-188-2175
286	Phone	201-530-5883
287	Facebook	@36wryxjt
288	Phone	981-141-2569
289	Phone	453-170-4173
290	Website	www.ocsaceja.org
291	Email	yk7skqx1@testmail.com
292	Website	www.nhxwjxsi.io
293	Twitter	@zlfm9c4m
294	Phone	819-176-7925
295	Phone	788-334-6170
296	Phone	932-324-2006
297	Twitter	@7ymclto4
298	Email	zmyjjwxy@mailinator.com
299	Instagram	@cmojdb2
300	Twitter	@0mowbe
\.


--
-- TOC entry 3644 (class 0 OID 16564)
-- Dependencies: 218
-- Data for Name: scam_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scam_types (tid, type_name, type_description) FROM stdin;
1	Phishing	Scam attempts to acquire sensitive information.
2	Investment Scam	Fake investment opportunities promising high returns.
3	Lottery Scam	Victims are falsely informed they won a lottery.
4	Romance Scam	Scammer builds a relationship to gain financial advantage.
5	Tech Support Scam	Pretending to be tech support to steal money or data.
\.


--
-- TOC entry 3643 (class 0 OID 16555)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (uid, user_name, user_email, user_password, user_phone, user_type) FROM stdin;
1	Adorne Foynes	afoynes0@zimbio.com	$2a$04$W/42SBGRx0a1tDtwLyQdtOCTxhmNvHkCfYeEF165M6Y8xHd8trqFe	397-594-0615	Free
2	Janine Proppers	jproppers1@spotify.com	$2a$04$oR6q2tftc.cD5UZoR68tBeMNha6RkR6WuSmsr0tRugTZMvR.1CWIu	638-866-9124	Paid
3	Marcy Wheelton	mwheelton2@123-reg.co.uk	$2a$04$qPNk124YVywNs8VkIKNXG.BT1mErJNveYYIqKgyH1FrSQTKHzaMRu	548-118-6222	Free
4	Hollyanne Noto	hnoto3@yellowpages.com	$2a$04$0SkQnGATnSZ5ALgQbjNjJe8AGyOx23fJsuvAqqQUKHX08NOtmYmuS	316-134-1450	Paid
5	Cassi Belk	cbelk4@discovery.com	$2a$04$SF.4zUoeogbplnTD5KtqReiD2dgEtviVCZzdSR9EMYeSyzWwyjlsa	267-351-1195	Free
6	Salem Solly	ssolly5@gizmodo.com	$2a$04$s3/V9UPrfDwD76r1/VtGM./a1az4ZSiABMRpq7VMy.jUF47J8aN5q	477-251-2602	Paid
7	Gerri Hinchcliffe	ghinchcliffe6@mac.com	$2a$04$zBD4T3y/x7Csrk6bgESMTeVdZp1ulh2BoNdC343hjg7i.ad5w6GM.	511-736-0968	Free
8	Emmye Smickle	esmickle7@netscape.com	$2a$04$eqMJSYpAQd32nSKHlGJmTuXL/4vTAht8jp8jTCUJ7skLCiFYtVvgu	414-666-6298	Paid
9	Rudolph Veldman	rveldman8@hc360.com	$2a$04$D1Yluoz7vSI8QeZfr2ThWeAbEOfMg4LW.BcejQ1GoZCQU.KgU.5py	598-124-9996	Free
10	Ewan Fancett	efancett9@last.fm	$2a$04$CQ0HvKxdXgmGjumYRvUXj.q/3ymh68fm24ELOIlm9kg.5Samgj3m2	357-905-9550	Free
11	Sauveur Glossup	sglossupa@bloomberg.com	$2a$04$Ox9OTiwvuj.53OFtVBCT7.dnCtZoCSv7naEhb/AZ0FzVSl4mSxtce	496-184-4272	Paid
12	Tedman Wadge	twadgeb@arstechnica.com	$2a$04$koyj.PbfGpXGqkxXMNioOOLLu5F4dYlUQ5XfuMv0Ya16QnvQRGIpO	187-644-8222	Paid
13	Duffie Schultze	dschultzec@myspace.com	$2a$04$VrtJyfnoBdMjd3M6Y05xyuhcFdWn2Y5BVzrX07fiJNuKy0DzCFmN.	713-827-7864	Free
14	Wyatan Idle	widled@time.com	$2a$04$FyHzlYgFvac/S84nsU96l.Lxj.nIqTGs7lQpS/02aONVUq56HZXie	412-922-1434	Free
15	Diana Cosgriff	dcosgriffe@fema.gov	$2a$04$g2Lmc6VItP1DMWN8WJBGLeCEgbuHlTfQsnc79m3ZeYCuRJYqRNV7S	646-328-3525	Free
16	Winthrop Hains	whainsf@facebook.com	$2a$04$NM0eXXh7lQPpOojDBAlqoO0QOqW7i/YCCJAHZ/1XqLo.VohLHSyaq	814-714-3262	Paid
17	De Aleveque	dalevequeg@printfriendly.com	$2a$04$XTaK14UULDFyCsEnG8Nx3OlNs8sNl0nvA6ZcTCj2lbEbLScnTY382	414-141-6981	Paid
18	Carolan Langton	clangtonh@bbc.co.uk	$2a$04$CfPpAE8/IDYAVNQu57lJfuTStBI/d42tL3SyDKEOyJCpJiHR0FLVW	235-363-1678	Paid
19	Patricia Sackey	psackeyi@wordpress.com	$2a$04$tmwpuH0XXgiTMMaHDgSZPO2AA5X0YDKs/ehDirSOqiNud9T3kwbcO	428-574-2670	Free
20	Arni Trevan	atrevanj@amazon.de	$2a$04$oZLyKDHNzW7VYM8f/Hz1u.Srnfmnrb9GX.TtxyK5MzqeH6hgfUmk6	603-637-7251	Free
21	Brande Vasser	bvasserk@soundcloud.com	$2a$04$WWyAJf7yAT4xbZEKcnRzIeBL3fSgZpwSoez6XQT19FYkncoZYarc2	988-118-0208	Paid
22	Antoni Kirrage	akirragel@google.com.br	$2a$04$J0jt1tV9wTKqNyhwxT/0UeeRH3gQnvUspaxGpecT0QUqh22lygWHK	394-799-5723	Free
23	Bryan McGraffin	bmcgraffinm@statcounter.com	$2a$04$xqDfTB9IA.BvP86v94N2n.AW0UWzClrk79wHNRI54rfJ6rp5wfmXS	201-876-4468	Free
24	Elvera Cosford	ecosfordn@pinterest.com	$2a$04$dHBocR2gEB8XOeTTgRayk.hntmyZCAsVgYh8MfOgy5PSM/E64ZJk6	407-786-1503	Free
25	Renae Fearey	rfeareyo@thetimes.co.uk	$2a$04$t3Ps9dLGfzf5lC5MnK0rBuKMBT3iUM9j.KYFPz5dNr8pYLFuhs.NC	913-351-2161	Paid
26	Tait Culwen	tculwenp@slideshare.net	$2a$04$F6xXWkkBUuyFS2.ac5gj9.CYtORiLgAsNDBh4nf3YffxI260uQlGu	118-535-9403	Free
27	Quinn Ansett	qansettq@live.com	$2a$04$4JYP2yiwdoWp/HJ9.qzLq.UYyBy6pBFtWieGuBlmG5thQeiRC96Cm	465-224-6237	Free
28	Susanne Lightwing	slightwingr@purevolume.com	$2a$04$IEuwqey7mtH2C0OklrYYxOY4C1cbfMY/2//VSzbu9y7bO2ldC0y6K	191-555-2819	Paid
29	Asher Ortelt	aortelts@mysql.com	$2a$04$PelHOJiaJfe9heIVEZDj4eCYDi0KRzsBJ60LMG3xDoFfnYjgtJZOW	492-763-1775	Free
30	Tibold Cuchey	tcucheyt@wikia.com	$2a$04$n23SHTky1bqb6TBnKPvOeOtUWT7UbwPBnA6cJ2iWYgNfVgvgsopD.	444-334-0380	Paid
31	Muire McCaffery	mmccafferyu@netlog.com	$2a$04$Y4c2KzDLzVaF2uU..k7ia.rel2qWL80idkI7JS8WG/aOjaiUXGpSe	775-240-0942	Free
32	Bobinette Wadworth	bwadworthv@mit.edu	$2a$04$Qw0BqaSqRoNns9skUW1xgucIY4UfxwnaxkIraxr9Zq2TYU1TTQTSe	913-440-9462	Free
33	Dottie Copeman	dcopemanw@mtv.com	$2a$04$GXIr3eW3U6PZd.dRC9Q7Du0ImE0qOFOMp.V0BUiPx.LNOCnyXTUFu	671-341-3062	Free
34	Ive Moulster	imoulsterx@bandcamp.com	$2a$04$yloztSCiSmRNn1zbZJJ5fOAdC2MOPKOVkxtUo4NYWnoUPPLf8TNgy	551-768-1634	Free
35	Mattheus Blencowe	mblencowey@flickr.com	$2a$04$t9d3TFi0vbXdaLCkky07GOTRD0sxVbetnEV7XUqc8bDDXrtiuCU5y	490-185-4299	Free
36	Rorke Ridesdale	rridesdalez@nasa.gov	$2a$04$mIDwC8/FvuF422pdadEc/.uU9LiZsHnzJ6sgOQBE1LBzfZ.IL3zNa	326-266-7858	Paid
37	Mannie Took	mtook10@issuu.com	$2a$04$76BETPkED7QuMczHWxRAee3sKoZmo1y50RkmWdYlwxxIXbR8vQG0y	767-629-1908	Free
38	Inesita Holbarrow	iholbarrow11@dedecms.com	$2a$04$GFa45.9NaTu0GBds290VRe3vNPbkc6UQ.xkoRHAm4UPEKHX5hBuGa	460-538-6469	Paid
39	Billy Philp	bphilp12@toplist.cz	$2a$04$9CIXCHXK2s9WJhAFhK98YOHzI7MZFrafPsfOWErnsf/AkdaYW3/VO	463-152-3053	Free
40	Modesta Sherston	msherston13@cnet.com	$2a$04$Vxl71TXx79sFq.qZ5293duhRn21r/jouq54Vlwn1gXvaQkxUzRdPq	287-709-5167	Free
41	Rupert Shenley	rshenley14@whitehouse.gov	$2a$04$KK6qLI3r0HGJ3iabnW8aBOv8jKJ5yX6YMq8.WzqEfoOAH.KorkMmW	760-100-7892	Free
42	Asa Wickrath	awickrath15@upenn.edu	$2a$04$vi3wf9OZyW2mBh.DrvMaW.VGoWtD8jbrBnGKHxjeb9ssyIa/12b1m	800-991-9447	Paid
43	Baudoin Peddie	bpeddie16@thetimes.co.uk	$2a$04$DD0kUeGIDZ0Xd70IXkZYaO/nlpq4zy1oOswmtnbpxOx//KZca2Lh2	282-617-3339	Free
44	Gilberte Luby	gluby17@cpanel.net	$2a$04$mPwGSfKFaOB7oS3GjHioA.dxz8PCcPW60/MHW9rXPz55ly4uvV0c6	444-760-5823	Free
45	Robinette Freschini	rfreschini18@addthis.com	$2a$04$/DDq54I8F.Qkidxsk.88xOTntXK4Wi.7hwAKXlHoWdEjDGaTSHrFe	860-348-2989	Free
46	Tamma Skune	tskune19@yale.edu	$2a$04$VlkNA9wPegdj4PnXrmc6meN8FvQ3nUIdZpXIC2bJIlR9BHzLi6REq	478-335-3586	Free
47	Boniface Randlesome	brandlesome1a@themeforest.net	$2a$04$gF5TfDPPu9DsvplvCjuIgu0r6Q7oAX32HGzGL8xB4CqboS/zmnnRW	809-941-3184	Free
48	Englebert Davidovich	edavidovich1b@desdev.cn	$2a$04$vnxUIviI9Jgs50.zIRC11u8T.iV49p.0gjSbqPys.sJ606R3lLgo2	157-623-5259	Paid
49	Vitoria Kestell	vkestell1c@economist.com	$2a$04$N1MePqOVZ8q/Q7OisLF1R.biw43Nt4m7LxT4gQ/bvyCrMklCj9y0G	847-784-5800	Free
50	Danya MacGlory	dmacglory1d@squidoo.com	$2a$04$DjyCGfex22OXrBkhQ3Jnoea0gx9aM.Be4Jm3bKpGtVIaClc443sm.	623-375-6966	Paid
51	Morissa Mulbery	mmulbery1e@gnu.org	$2a$04$ST9sxKLbmfOLaORlQ2N.AuZ1K.xgaAJ/oeNlbGXJJLQLDZOI52CNG	574-988-7325	Free
52	Ardella Shackleton	ashackleton1f@sphinn.com	$2a$04$N9z6ePwaLB8FX.UPCJx9c.wkFf/qmIK9PwngYYtoLt/xJ5BGWP3L.	358-408-1850	Free
53	Rolph MacPharlain	rmacpharlain1g@amazon.de	$2a$04$IWuNOxDWz4B4C.3eMCSFMeYpth92wDh1QxFPahg1GJxgODMvne.hK	944-574-1699	Free
54	Netty Bannard	nbannard1h@telegraph.co.uk	$2a$04$sYzIz7QmPEQkMQg0Px/imOhlDrFz1u957UvNY7ttOpNMwowYfLgu6	686-491-1438	Free
55	Karlens Trustey	ktrustey1i@sfgate.com	$2a$04$jeTenHJS.1SraHzgCSiUIuLcIco4y0jNyITQtgetVT54hZnNK09Ra	444-797-9036	Free
56	Zebulen Eastop	zeastop1j@tumblr.com	$2a$04$9FKdKbUpJjmsMUf2hJECG.Ql5PHBQxJ4xG/H0SRC10jyRo.7NqmTW	378-402-9813	Free
57	Carree McAteer	cmcateer1k@paginegialle.it	$2a$04$vc3eBJJU.dkNUvGL4Q5Dju2AJ3NyBSrmo91EcFD4oYDaI1KhQEyJ6	653-171-7699	Paid
58	Simonette Niemiec	sniemiec1l@gmpg.org	$2a$04$9UbLa5.TehotV83xI3cQwOujEjvTVi6467DeSwus4eCfxCYcG0RRG	661-439-2721	Paid
59	Cody Ramalhete	cramalhete1m@ucoz.com	$2a$04$tN0oH41r2N4nWMwiT5M/MezopEqKx3YtnRYI0NPkBAO3PHWpIpRsG	903-894-0570	Paid
60	Dario Tumioto	dtumioto1n@dedecms.com	$2a$04$qbTttVT80Ue0qNZFpIumoeIObx4Hv13nj8UYQOkBDYI4raphZZbl.	166-785-0225	Free
61	Catie Devenport	cdevenport1o@fotki.com	$2a$04$ydtMN6RKzo15ZfD56A/52.NItvIBFf2tHA74IydfY3E56C6qOPFje	546-454-7927	Paid
62	Bea McGrayle	bmcgrayle1p@netscape.com	$2a$04$Qx78061LAwEYVqUsxGAhE.YhJjeOIiSDtP22yrcxnKYuXC1B.i6KK	790-692-2734	Free
63	Judi Guilloton	jguilloton1q@barnesandnoble.com	$2a$04$UBJCcBSSiMdcZu7rD3AseuKF6pxGU3N4VSncqLynJZOhJtWdb.YS.	629-495-3481	Paid
64	Mariquilla Crampin	mcrampin1r@nps.gov	$2a$04$LFyqxoZNHFN9/QbJNHoJge6v50SyMz7.gE0LNnuoWOfxlTT8ptTOu	978-841-8694	Free
65	Fancie Smye	fsmye1s@house.gov	$2a$04$q59wCMpfEJ/cwiYebofVLOuFTB4MqREW178z44cAzAbjE8BDaeP66	971-981-2701	Free
66	Krystle Goaks	kgoaks1t@privacy.gov.au	$2a$04$eeyZyxymV9TQSViBTsdsJONARM9tvnxBmtu547QFc/FpPkV.enwnu	686-805-4611	Paid
67	Noellyn But	nbut1u@unc.edu	$2a$04$MVQ5xj6aQ4PKIPoiKY2dJ.7D/7Qbulmltqc7BG0hGlgYTQYtl0eCa	696-178-1662	Free
68	Malinda Londesborough	mlondesborough1v@mac.com	$2a$04$XKuRXmneizh/SiEXCHRvcudEilztPEV3XDC17MGYlRP4GNz2qP2yW	498-245-5724	Paid
69	Filmer McAlister	fmcalister1w@scribd.com	$2a$04$d8gEBMRiafk2RGLCerrVS.bhGwfNhIt79FB0GSb0EtGNUJ7fROeBO	629-712-7747	Paid
70	Caril Cartmer	ccartmer1x@squarespace.com	$2a$04$MQXrpKi8lMn9epJrj.HsTOvgTqADFBwbEKIptfGn29N431vLIt4km	961-117-1596	Free
71	Fernanda Robertazzi	frobertazzi1y@fastcompany.com	$2a$04$JDJtmga8QY2RbNUrYYwflOkDEgJQ/wYP06vAQGcOoIloHxfyJeeTu	127-558-2289	Free
72	Farlie Amner	famner1z@behance.net	$2a$04$3A0C4xWMlSmMGU/Jjhah/equaUcB1Pk92OJan69Vbc2ynbF.1xAH6	295-224-5621	Paid
73	Timmie Jeafferson	tjeafferson20@rakuten.co.jp	$2a$04$d4WffgcmsWvOU3dQeyvOUOEtfUFtYZPRvLh4CUW3CwQEBb2k8N1Du	711-236-5518	Free
74	Roselia McCory	rmccory21@hugedomains.com	$2a$04$NZO9iNOjPwn/ABpLslmGyOPizxgMA1S6dtKcURNDPw/eHjlKwC0Bi	799-561-4336	Paid
75	Dorris Halhead	dhalhead22@baidu.com	$2a$04$.i1rTWj3iUTnSKaqAx/XReJrULLjvC6RJSsf1CDEJurxTTtxj7d76	837-489-0610	Free
76	Josephina Vasilmanov	jvasilmanov23@huffingtonpost.com	$2a$04$cJM/x7gfDJcmQhJdOrMG3OMESaJCrDucAodr7bfS7w0.MsJ1RHsji	197-604-3627	Free
77	Caesar Gallaher	cgallaher24@reuters.com	$2a$04$P.TgwFG2gDgJ88WHZeionuNjbi2kfDSKK12vFcu4frMwQF0qk1F8K	481-250-0035	Free
78	Clovis Bernolet	cbernolet25@addthis.com	$2a$04$wYxprx1F3I7fw5RygYZCU.Y76XKSnNxbI/FrKChcK7i0N3sQmAZcy	374-595-7949	Paid
79	Emanuele Midford	emidford26@csmonitor.com	$2a$04$WGLdwAgXV4ZNyuQbS.BmP.D06Z9Z7ELSQU0TK5zgRGr8vI7O7omx6	412-302-7145	Paid
80	Skelly Behan	sbehan27@admin.ch	$2a$04$Diejd43n0o3PGWYC8qYZoOKlIf9yO9.KjgfurmLn28NGssKeI8dAG	165-546-4485	Paid
81	Pamella Meaney	pmeaney28@arstechnica.com	$2a$04$xhsTFvWB32uX9Lb9auBOoOeCEMhQjatLhhWirbP10o/Jr91bIsmtO	281-790-9193	Paid
82	Parsifal Biggadyke	pbiggadyke29@nyu.edu	$2a$04$U/b9i7ak.hLp6GIDkIsGd.2zZXnZ6ID1wHY9oV76c.wNEKFAm5w/W	270-111-4160	Paid
83	Georgie Prigg	gprigg2a@oracle.com	$2a$04$R9kSpUU9/J6.XUQk0m4WTedJNUqojxrHzHtO/Ol7z9Ox412uTmeae	549-737-4083	Paid
84	Jessa Benedito	jbenedito2b@va.gov	$2a$04$tIWkLQi9b2Fv26cJF6K.0ucA/M8IAMTLRBigcihVYbyzQj/JsHVI2	457-580-4737	Free
85	Lion McCutcheon	lmccutcheon2c@unblog.fr	$2a$04$.xAhtSIJkkAmijd5VV8hzO/FTWQVyptWiLhl.IMlS3lZQOZSZ2pXy	178-367-9849	Free
86	Zorana Mussett	zmussett2d@bravesites.com	$2a$04$9CtpPyhfW6B67RJFC/FHPuOLHVSVrT0ergQmakiGZWwauBTfEkRVK	633-652-4160	Paid
87	Katharine Stitfall	kstitfall2e@gmpg.org	$2a$04$3Aqq2FlDoLyqveTxRs/QSuw1/JEH4JAQ3cqKWjImokZ5TtcmAt0P6	682-778-2718	Free
88	Leonie Chatelain	lchatelain2f@soundcloud.com	$2a$04$Dy1Cnek6eX2F7Dp4ABzKre9fR/19FJj2DbIVkz.SkrWXc0tcr5hve	608-489-0868	Free
89	Sheff Courteney	scourteney2g@hibu.com	$2a$04$OZkNpOTeT/TbLSfCdvqJt.sGfLF/i3oU2NtmwLAqPVT0kUcVV3eIS	558-257-6820	Paid
90	Coleman Clash	cclash2h@issuu.com	$2a$04$a/JMyO//018ystGI9RXNHe4dTFzAlmlHJecdOXDwZMubyMzHo0Dlm	675-897-4399	Free
91	Lindy Malcher	lmalcher2i@nyu.edu	$2a$04$MIHeNv/H60iEpGvnJ2Fnbu9w6nHU6ok4S81.NplDfICwVBRMOY3ge	570-843-2338	Paid
92	Jessi Sebright	jsebright2j@google.ru	$2a$04$VAehLchZLeTkFnx6y6lipuMmbPvQNWCIcMNvQx3Kw3fs3sXrVShvS	248-903-9424	Free
93	Dore Mesant	dmesant2k@nifty.com	$2a$04$5R2ZHE6X8j8oFlHwPxBlluQMGhobSEviRhGAq4pJy26XaTsECTz3y	211-290-3216	Free
94	Silvano Smye	ssmye2l@istockphoto.com	$2a$04$bbrm5OwJ2FfJPfZNzUPBAO9KLkY5oFrmG.q.9wFMuvdIYS2.tA8Ha	904-588-5101	Paid
95	Tiffy Haxby	thaxby2m@auda.org.au	$2a$04$JaSPmBwJNQhBbXRBcvaigevb6n7XqSgtAjMd.WdZJFkXaTFK6jNQO	999-452-5609	Free
96	Artus Beltzner	abeltzner2n@abc.net.au	$2a$04$u/36uq6f2j3TwpgqgiyJlu228liwqNKD0P51Dzkd8nQCGktGSbna.	624-932-7480	Paid
97	Lenard Secrett	lsecrett2o@1und1.de	$2a$04$td6Iilh2IbJR8o6k613QuOkR4pii35kuSU89whpExeUJQ5ZoKeY.C	686-815-2981	Paid
98	Lyndsay Slaten	lslaten2p@dell.com	$2a$04$F2fncVT2d8Hi//7wmlO6H.pbwi.06bUitrtEn8lMiCdSFzzpSbP6W	746-281-2404	Paid
99	Meghan Harmes	mharmes2q@unblog.fr	$2a$04$Vhiy0dqhW6Fws8o46SdglODfECakiXhL1wABLjcxc/2yqdS2Gn402	646-448-2614	Paid
100	Jackson Marciek	jmarciek2r@vkontakte.ru	$2a$04$OdWrK8zpnyrwVvbVYI2NhekxWwsrLc48FJjKPgHufXzaMs2w1xTdW	346-495-7371	Paid
101	Sile Antonov	santonov2s@xrea.com	$2a$04$LVTdlNdd4qVbm5or8u5Z6.4J9NxK0KdGNyHisupwQQMqW/VBKxkHC	552-523-2623	Free
102	Adele Cullerne	acullerne2t@fema.gov	$2a$04$HWi.PYCR9RwYXTCwG54GFe.GAyM/PrTv1IeCPyVp9syilz.zE96Ke	456-386-6085	Paid
103	Eadmund Trimble	etrimble2u@tripadvisor.com	$2a$04$wdp4Rtj4E43QwBpoA.LQIeFYaNVolzAt/4Hr3dIDvNlR.eYcYXSoW	699-500-8377	Paid
104	Far Surphliss	fsurphliss2v@un.org	$2a$04$tmO/Bbxa2WQDWixPmSCegeUXaMPmrwyqWLTNCfuwzQcQV3pvu1YLa	150-829-0681	Paid
105	Evy Roma	eroma2w@cbslocal.com	$2a$04$wNlo4Z8eIoVTh08ABfr95eAsSmEe3wdRJo0.HoGg.6KsJyNPRUKXW	208-753-8468	Free
106	Pansy Choke	pchoke2x@tumblr.com	$2a$04$5hdziXkAj/e.ZY8/NYKQAOIN5uYDKCPgFfwbmchVJuPfb2nNX/OeC	164-530-8591	Free
107	Bel Enoch	benoch2y@spotify.com	$2a$04$d2o4t3I2s/goW9KwvqGIquGfoDKm0S7dZIFDUnKhrgge0fja2RALu	786-960-2510	Paid
108	Ruy McLuckie	rmcluckie2z@answers.com	$2a$04$OYiBY49hSFBLFROEuNsfweQqPEbtKrW8.ktJg3hpth78IIq4IDkm.	181-247-8038	Paid
109	Pauli Snadden	psnadden30@google.es	$2a$04$ztNeZNAO.uxniRhb4TZUpehMDpW1jo/2bezBesGevA.tD6xDpALPq	488-438-2100	Free
110	Peter Jerram	pjerram31@nyu.edu	$2a$04$1Y0J4L267fg0wTPYPv.dUO4TWDAwuMuZG37sEA3c4gNEzSPJZYz0K	871-755-5289	Paid
111	Codee Warlton	cwarlton32@scribd.com	$2a$04$HYfIpcF3uJEHazaNC1UGmOg70p3wMXV5GehCYuDOuyzTRbRtCEP/W	810-402-1043	Free
112	Vick Largent	vlargent33@pbs.org	$2a$04$Uln2ZYAVZSlVi4KVpBWGYepHUVzK2QxlAuekXKfhggu29m/4iVygC	722-336-6713	Free
113	Chick Banck	cbanck34@nymag.com	$2a$04$Qk4CJ6uyDVvneyy.lnkjOeSEQigNK3g051ouDyXr8QoSBVDjk.cxq	932-318-6766	Paid
114	Cicely Flipek	cflipek35@bloglovin.com	$2a$04$pSefydFbXh0M09DP5peKc.H/0MkxeYyx9ESmWh7X59M3QHekJ4HgO	811-190-4532	Paid
115	Marabel Spykings	mspykings36@qq.com	$2a$04$xxGmBJEAqp.yjhULMUdYme..msZNzEFceytQiH3gVdK6CZmnb3q4G	234-278-0007	Free
116	Cody Scroggs	cscroggs37@zdnet.com	$2a$04$ui41vvTQOAXNZxPLuhMSFeiuVK8LHkRBzkT8sZ99JDoJ4iqa5HouW	893-134-8286	Free
117	Dore Orum	dorum38@tuttocitta.it	$2a$04$73FWc257VCJyTxNwVBR.yOm6wX0MXOIH0AOGBoYi6lkYNxdxtEV6S	267-627-8941	Paid
118	Antone Vasentsov	avasentsov39@opera.com	$2a$04$vjdOp94JQ3RbktuQkgnRAO3hb//4dV1oaTyKa02V8.ql7w7PVHtfi	971-274-2033	Free
119	Gabi Tapping	gtapping3a@clickbank.net	$2a$04$xqw.AbPXutMRvnrPPKyZI.zNCB3FSWuAeindb8cNgmHEB0Trz42mK	215-545-4691	Paid
120	Doy Mayze	dmayze3b@cyberchimps.com	$2a$04$drIzz6XwTF0Y.2qlgYKe3uRB.wn2kmIoU/y8lAFikfbvzfleH.Udy	780-513-8525	Paid
121	Turner Bastian	tbastian3c@businesswire.com	$2a$04$0CWhY3H6yxSDea5eLlLY/.vyCiUYqkxoUIJKsbsVTfBhOzyQbRE5y	958-114-7219	Free
122	Rhys Souten	rsouten3d@360.cn	$2a$04$0Gj1B/gscp.NCnYLZxVoIe4/zMxJbPaFYhRwAdagZJOEVv.qIpHLi	567-871-7461	Free
123	Dee Dorrington	ddorrington3e@tuttocitta.it	$2a$04$.rLJP2T.8/EKcSqFU3mJcu9fJKbE6mgZ/bPLKUqcGgkkR52MtPGta	714-292-6957	Paid
124	Joshuah Rigmand	jrigmand3f@creativecommons.org	$2a$04$2BBZiYldRrNUThQOFDOi2eIMNQb7zRQ31Z69BQDasx5zH9Gua0fpi	928-683-3064	Free
125	Michail Clawson	mclawson3g@360.cn	$2a$04$E6oA5mhlIBXPdUTQEbUmtOztKy.iWEbCnmPwn.oPKgnbL7gy4Vgh2	662-237-8450	Free
126	Lorrie Murfin	lmurfin3h@umn.edu	$2a$04$GsL0F26CcFokwyU6gjAq6Oc2vLj8VWSVcbs5K1tO8K5qfmu8XDivG	141-134-7988	Paid
127	Ginny Coneley	gconeley3i@comsenz.com	$2a$04$SSSw4nwXIaswq1z.vRBKg.mcv4h1r0ED2WImJyGulfLAUUPvNneLm	402-495-7850	Paid
128	Lavinia Stripling	lstripling3j@prnewswire.com	$2a$04$sfb/y1BXE0cuVy.xse5nZO7mbpSJ2R3hccJNWkfZUxRmZAoss0tNC	469-926-1420	Paid
129	Constantina Deluce	cdeluce3k@g.co	$2a$04$rFmU9jlYwoUoehKq.8l9Vupvzl8knPBkKnFBeSmL0rnSq7BC3LmDS	476-893-5808	Free
130	Linn Alexsandrowicz	lalexsandrowicz3l@merriam-webster.com	$2a$04$fIxoYAXI0zeNZ7sSbqDgoOk.RgbxGeTjXuGAXqdXdREKgMYtjYW9C	206-982-6597	Paid
131	Lilly Thornley	lthornley3m@psu.edu	$2a$04$NSiOy5uFkm1J.RPyuCNcKOJfwQq0H4LEHZKcY52mfS1LWnf376Jwq	416-228-4073	Paid
132	Teddy Boarleyson	tboarleyson3n@cdbaby.com	$2a$04$0hW.tt6.ozgvgHZUUYtUX.4SIj9O2ozMo/l4IF0JyydeZMt6UAc3u	894-756-7860	Free
133	Joey Schirach	jschirach3o@usatoday.com	$2a$04$W94mwyINQ6TsAFol68kS/OQjYoFsrN.jG2TiAC.6Aqha3hdIliQkW	742-849-4940	Paid
134	Faina Narey	fnarey3p@wufoo.com	$2a$04$erns1knazrqn8fawNk/jROJ4hRHOwJ5IIsOYkZHeT4CC5bJ0n9YGq	594-296-7439	Paid
135	Cara Leverington	cleverington3q@amazon.co.jp	$2a$04$pcqybAI5Qo4WYm62SObWiOQsTYiOvehKOrJDPYDRxVOiCrsasagNi	306-841-4685	Paid
136	Brook Sawkins	bsawkins3r@nifty.com	$2a$04$EVdeQwMtEUVzhom6rn2ATOUeQAMS/64IJEx6/DISolMH32xKtF3OG	519-622-0891	Free
137	Ali Bousfield	abousfield3s@storify.com	$2a$04$ILWGt2YCRekiyEdC0AKoO.sQ5WIxSrSPOY.flQs6Z8AZWwzy0/TcW	962-847-1196	Paid
138	Karney Blackmoor	kblackmoor3t@tuttocitta.it	$2a$04$/BZbppB8oZFuhkCjEtHQxuS5Jwhye5uVt0tHYi5tiLhw6wJ.ADk7y	747-279-9659	Free
139	Elysee Mufford	emufford3u@nature.com	$2a$04$2B1FMtVHEvPwIIbQYJIzgOgDg7hUt18euCUE7QhjuPIsPHCop6ZCu	330-769-2259	Paid
140	Earle Harmant	eharmant3v@harvard.edu	$2a$04$iIcK.LgFOGRHZ9BoCBTf..BThRLqLxucWTw6LUyo6L8iqKjGf9f9.	109-971-9182	Paid
141	Betty McFetridge	bmcfetridge3w@cdbaby.com	$2a$04$B86HGOrsnQyLzTkn7D9zyuYFF0lmtGFS6wb4s182qemGaAsk/uUli	768-850-4596	Paid
142	Anna Muncey	amuncey3x@nydailynews.com	$2a$04$XwQaJInFZsqXnOT98G/w/.hzvUJUbVKAFokgWl1mrNGvRdeQ6BfXa	651-951-9975	Free
143	Homer Dablin	hdablin3y@oaic.gov.au	$2a$04$doQ3mX3w6orIAa6jEDa2yOgQ2ZZFUCTbgNcV1I41IHO9Y4A8T.lTC	355-811-8008	Paid
144	Mina Staziker	mstaziker3z@accuweather.com	$2a$04$uCczHLc0YK7.zAno6UQU9uvQRiu2/KgLclcINwxFewGJ/GZorKdg6	367-547-1614	Free
145	Shirlee Robeson	srobeson40@answers.com	$2a$04$zLPtBB6Rqu3mYX5Ph/z/dO4yPcRjJGe8jC7jOYg.D1/xkCsYhYF8C	728-445-3908	Paid
146	Aleen Hulson	ahulson41@ovh.net	$2a$04$RXEcQhTM8S.Ct0MQWYvYCeVMpkEMr6Oy/2EpedvNNgBHZK2v/o03.	309-354-3894	Free
147	Hildegaard Bartocci	hbartocci42@123-reg.co.uk	$2a$04$h.Tz4C1i3XHqnfcGCr7VEuW4EBTNAiE1YOCwfl0brHtqSqzCLWKiW	165-334-2844	Free
148	Tracy Digg	tdigg43@ezinearticles.com	$2a$04$UcFylViXZXd1A9wYTHG9TuKSH8ZAkun5TIt82Wmlfx/oZEy9KEE4O	245-721-9040	Paid
149	Flo Tuminelli	ftuminelli44@psu.edu	$2a$04$/0ojR/CQmJENdEaOmbEzFugDmIAIc3aX9g3UNOYnZhCvsuTekw20K	774-106-9421	Free
150	Rickey Owens	rowens45@sakura.ne.jp	$2a$04$iuIuiWpx6R35yx/0a9v/YO7sX8FVZFyrDzNm5ysQ2UHhnpXF5YMxC	491-673-4997	Free
151	Cherin Lankford	clankford46@engadget.com	$2a$04$qbIi3RUOJDa0YqyehPNP2ueiZamAisZpoAgnmKW4MWUctgxAZ6I2i	911-582-5492	Free
152	Dalli Andre	dandre47@jimdo.com	$2a$04$JlDUPnNdTLNQBjb/Pje8x.aaeyRcIByqTWlq1VL9JaA87xaXetQai	319-713-1154	Paid
153	Selig Garfath	sgarfath48@flavors.me	$2a$04$VDO4m1IAQtD/f2uB6Ukk0.q5mKdUjXvvdu0kZeQ0GbfswW/gtSNyS	865-316-2157	Free
154	Carlos Crutchley	ccrutchley49@smugmug.com	$2a$04$46qOQhFywXaqau2P5Jxz0OjxqnI8t5Vw9TH5MyX5POU7dJSbrskQ.	216-190-0730	Paid
155	Lynea Showte	lshowte4a@youtu.be	$2a$04$kazVmiqfKQpzoPSnTz31HOP6Yjz5OoG24e5nXUA9jTrC11QnOKhTy	761-301-5660	Paid
156	Dallas Fould	dfould4b@sfgate.com	$2a$04$UP4Q5Ye.dsF3qTKEhINU1uSBT5I0m2O9bcA4dpa.1qv6twCNDA4tC	443-961-1893	Paid
157	Anatollo Scargle	ascargle4c@yellowpages.com	$2a$04$ChLIeCaUeiG69X0AlohU4ed2Ei187BqxAT7a3uHgQVoKb3i6WW46W	446-382-1500	Free
158	Buffy Henrionot	bhenrionot4d@fotki.com	$2a$04$TVLh7xlbaDV6SuTBQtU8iOI.bNQQn.ZjuuigJW7kcbA8y9tO2eW/y	642-530-5794	Free
159	Melba Catford	mcatford4e@plala.or.jp	$2a$04$kG0FYmM/jqIIBkzs56DL8urdOv0c9AYg/Ul04suG1VxxoTbJz2qdG	929-322-0388	Paid
160	Tammie Fermer	tfermer4f@tripod.com	$2a$04$wjd.7.ux9KnrYgocbdsUu.Rb49kTrJqDUutbcizK0me2B1DRWYHyC	181-356-7638	Paid
161	Timi Hearns	thearns4g@blogs.com	$2a$04$cFL3fHdDt0Id60n1hUfDFe6olJKRwZttUDmq53XVOL.fYROKepG7e	762-459-0336	Free
162	Yoshi McLafferty	ymclafferty4h@ocn.ne.jp	$2a$04$ybV5yUO591LhL9rrpxG8lO4ebZ1ImOstyfNJsKZdalZwGrOHAeoQ2	883-537-5825	Free
163	Edee Shaefer	eshaefer4i@forbes.com	$2a$04$e98i.aOmxU2AwEvY2O/o2.h8Xc1MvLCeNqRmdKmTJeKQo/zI3n66K	875-745-3276	Free
164	Christoffer Poultney	cpoultney4j@purevolume.com	$2a$04$f4ZDmjg62SYbbh3tfmpgfu68g33cm7K6SA1FYUNkiFDlT6cn63j6G	932-359-4571	Paid
165	Dorena Drennan	ddrennan4k@mapquest.com	$2a$04$Gh11UEgHMlbSGhHDHVLb1u8DKz99PCyLJVHHcuYuxIlYh84yVlyJW	280-758-9811	Free
166	Valry Hannaby	vhannaby4l@wikipedia.org	$2a$04$f.RmJ2u0GRN2tU67ApxgcuZnI2LxUdcStoQQ.KAKfWtH1o9qLyCje	951-858-6001	Paid
167	Glendon Duker	gduker4m@cdbaby.com	$2a$04$uoNRRULK7eucgVl2h9qT6.v8sZ4cS9giGosRW.nZn6Ggl0H5Z795.	971-836-0110	Free
168	Ernest Massingham	emassingham4n@deviantart.com	$2a$04$DVr32QsM7SSe9QC46nUu7uF2SsSHBgetv6OTf8cr80Q4pXDyzhS5G	362-514-8209	Paid
169	Jack Arrighi	jarrighi4o@geocities.jp	$2a$04$xfOxqNxG7V2C68ITFZmeG.OR9HmimombiISUU01n4x9j0hEJT.lpi	525-692-3581	Paid
170	Fernando Pidgeley	fpidgeley4p@nba.com	$2a$04$DDAqxxUVlhSCct1krmU5yee55RsjZUywbojThnXeCFaXWYaTSks/i	102-357-5678	Paid
171	Chiarra Berthomier	cberthomier4q@homestead.com	$2a$04$8qCcsZhDPe2Gl1O6qBx/u.5XwrwPFXaiexbxLS2MGdOtQnV/XWp82	360-414-9253	Free
172	Lissi Mottershaw	lmottershaw4r@kickstarter.com	$2a$04$i5ugQYHhyBKF.4dIGLX1..8BiJrqnyzJf0Yh/9T/dNmrh1VT.NoGa	667-713-5311	Paid
173	Duncan Phillimore	dphillimore4s@altervista.org	$2a$04$HhiDphzKj3EWFLLYKv7u.eF8hyeaP1Mw/4FKzcHDYjzc1AxQmQy3C	617-736-7730	Free
174	Tripp Twinberrow	ttwinberrow4t@mozilla.com	$2a$04$pEK2tWRE60wIAi2SRPUyNumzUrtntcpl8XlglGWj2FIc6kJLlYbPu	513-607-8181	Free
175	Yasmin Fermor	yfermor4u@ocn.ne.jp	$2a$04$WXue1bd8nPqwlsZz1GDYwObZY.ULuX7.fJemVjQefKH1YOyrBCgfy	313-471-6209	Free
176	Ammamaria Sterricks	asterricks4v@skype.com	$2a$04$ulbrqsKXQId/AGjEgsQl9ufXYnOmIea.NcSsimAZXYPzHYGI2dOx2	917-103-5683	Free
177	Lusa Kerrod	lkerrod4w@scientificamerican.com	$2a$04$2/J5dIDE0bUzx.kA4pLCruzdvvRr0saKqIjQ8AcLkvJJogyC5HeV6	507-208-1709	Paid
178	Brenna Queste	bqueste4x@clickbank.net	$2a$04$CoHYlWnOtxhFSD8tYtEcIuL0UNGVGFxbC0iqZdLDQzRN8fe8wuK6u	665-259-6657	Paid
179	Ronni Whiffin	rwhiffin4y@chron.com	$2a$04$aRYYbwOmxEnQ5.hi9QCk5eXpSbDSP8JMLUk8b.w.8nL9QqZPGl.um	314-162-0186	Paid
180	Nicolis McCaughey	nmccaughey4z@blinklist.com	$2a$04$OgxovRkoFymawFljz9t0deOpoYYZuktH3lC7twnP0NDUpWYKag1BG	717-345-7292	Paid
181	Rogerio Deare	rdeare50@uol.com.br	$2a$04$UI.2bXMFFzNiCc6dg2AhfOO9e1mNWgOt.FtOK1pjXPfbfZ1c/d6Ty	207-862-8929	Paid
182	Abdul Serjent	aserjent51@dyndns.org	$2a$04$jQKnYQHoX0qYzI2lYqbYkejAThBwj2fUsa9k.pcnzYXTT1nT8Mz4W	734-689-9375	Free
183	Byrom Hanselmann	bhanselmann52@1688.com	$2a$04$.IMYWj8XYn0xeLRGl/23ZO8uj.AD7Qgn.baUpL2L2CmtQH8nvAtYW	235-471-1384	Free
184	Dorita Feldbrin	dfeldbrin53@netlog.com	$2a$04$nvaX6NFiY3UGuiwoIe2FF.bvjbBWrGuXVyAMMWd1duHieNxJ6mqo6	549-160-0154	Free
185	Celestyna Laingmaid	claingmaid54@cloudflare.com	$2a$04$72TUAMQb4idWTzZSAnO5V.quv9QZSwBCULni4lbhdEGFybHLwJ8am	775-847-3722	Free
186	Steffen Cleyburn	scleyburn55@skyrock.com	$2a$04$o3XIVmxgZVkBx0AK/TjFZ.UJ97c2TSrBPo0WbheAKpDt9y6PMnPOu	224-843-5804	Free
187	Nehemiah Tesauro	ntesauro56@bandcamp.com	$2a$04$OD2B79XWieOG8CpEK375NeaLHioQZp1gE6KRCrkwNUPjZfnLvH1g6	661-869-2962	Paid
188	Joann Boness	jboness57@creativecommons.org	$2a$04$mep.jlB6CCLPWy51j23GsuaclQWu4mEkOG7iDp600lFb/AdV4p.NK	811-275-5799	Paid
189	Dedra Wyper	dwyper58@europa.eu	$2a$04$MkYREYhpkB6l8/0GWmKITu92sGZmH7EC8SKWlgyWVNj41V/N6YlaS	561-789-1070	Free
190	Noll Brimilcombe	nbrimilcombe59@histats.com	$2a$04$AmYPqSdR5q5t2PIaDxJhG.0wFPikBLX/v.txlFu0Fe36vyj31uv/6	812-802-1001	Paid
191	Cora Shevlin	cshevlin5a@wiley.com	$2a$04$/QjKL.MdhaPO5/lfZLQfN.pzmLe6bPkkWO74pII33kcLyBmBdmplC	164-997-0571	Free
192	Conroy Callen	ccallen5b@cnet.com	$2a$04$gi5L257F19JxzL46Zc5vw.BUI9pL75r.GSNdDkv9FNjXtGdLFo7Za	172-123-8738	Free
193	Chickie Stiebler	cstiebler5c@gmpg.org	$2a$04$AqWg162bEn3JFt/nyEat/.Sqk2bruSeS8FGGVoat7rbBTRp3ohFw2	951-628-9273	Paid
194	Ansell Vooght	avooght5d@ibm.com	$2a$04$deKugjkveQhJ0suaKF1njOmyUFUyJI1h7XJh90o8swSlqaWKatEbu	719-378-6662	Paid
195	Kristopher Effaunt	keffaunt5e@w3.org	$2a$04$8NmLK8vFhT8AsUuZNLA97u/dGkebumChLTFmqJmuv5V/q8bt0xBcy	238-655-6821	Free
196	Myer MacTrusty	mmactrusty5f@omniture.com	$2a$04$jSjP4UBDTN.W10sAM21SwefBy2xhKx4nh8QfO4HXL5gcI5TY8bwwi	925-273-6908	Free
197	Weber Ofener	wofener5g@ning.com	$2a$04$oui5YI5qUE1fZlFE3nGexO4jUCgPjUdrrTTea5bA/c/xT1MQ0HBwa	165-951-9203	Paid
198	Fidole Guilloneau	fguilloneau5h@netvibes.com	$2a$04$Mmoc1NugFokMYfefVAjN4u9w7MxYQenRnNyCU/YZ9G.WPhFi9y4Na	929-648-9769	Free
199	Batsheva Andreix	bandreix5i@walmart.com	$2a$04$iW5VEt4A5d..B8O.2tnfPOaoIH4ZpgkuNrhnDZLQsUgZHLGHKtexW	155-528-6695	Free
201	Brendon Armstrong	barmstrong5k@google.cn	$2a$04$//AS4mZ0dEEhyHy0se9C9uMG5Wf5pyj6Rjp1/Hb0uDZxUnJ2MV/Fi	757-410-2968	Free
202	Claudio Batterbee	cbatterbee5l@wsj.com	$2a$04$MKmE1r/SEUiqO3BtT4NcAe0qdIllO1t74I7rTr/xhhigjrEPtAsBm	221-718-1548	Free
203	Bryce Struijs	bstruijs5m@unesco.org	$2a$04$ogcw89z11kqSC7P/SXKSlOD9nTKY52SeiqJF4KVzrlTmW9x5yaoNu	678-775-4884	Free
204	Davidde Chippendale	dchippendale5n@parallels.com	$2a$04$jIric2ya6/zJI4nmBIRvDuFfDTL2KVWRfUjCQUAgQOV83q2MuGTAu	362-176-1725	Paid
205	Flossi Still	fstill5o@surveymonkey.com	$2a$04$.3qcAo.LubQBG0k4LCn9e.GBLs1aps3YnHkr2IiUHpouOlifDSpuy	864-497-8584	Paid
206	Dana Flasby	dflasby5p@sogou.com	$2a$04$aLboIprNLgZ9ZQQatSfCpeFS8t9VXUZwWQtC5RwtIMlLxVeVOhms.	597-145-6911	Paid
207	Ammamaria Leiden	aleiden5q@newyorker.com	$2a$04$jc97wnuMh5Zt.ckDmjCXCuSdzovAH0oFx./hCLMtlUy.lL4bmDgHm	201-193-7525	Paid
208	Gladys Durnford	gdurnford5r@jigsy.com	$2a$04$jSjc9ysuRoRfndOs1DErV.EKfv5Vls/WYumrr/dr5N6WWPVEDBT3i	916-542-4050	Paid
209	Jedidiah Buddle	jbuddle5s@chronoengine.com	$2a$04$Bnqs1edzb3Jb5qmRiQOZWOImJm3E03tGNqsz2c2h.3hG0JC5XVUym	413-294-3902	Paid
210	Axe Arthur	aarthur5t@i2i.jp	$2a$04$A5zjHkCrYQ3bb71DMggO.OkkWo856PIHiPUX3NNCqq89VC82fwmD.	358-718-1919	Paid
211	Royce Croxall	rcroxall5u@goodreads.com	$2a$04$Mkfjdqvw0qJw.IG7x63Sc.Ic4nURf5XCa00NX1Ti45B0J9CdY8asW	483-633-2463	Paid
212	Tomasine Reedie	treedie5v@discovery.com	$2a$04$3.KF8Z69IJ.ZgW1s7MgVve3HErnx6Y7D5L.n1IKQx3dQMT5QP.Lvi	954-567-5226	Paid
213	Jacinda Pendell	jpendell5w@skyrock.com	$2a$04$BjzySsMYA.GCXhIZj3ENv.GOYwEPcrs/p2K03yIofd6xya2UAFvEq	348-183-1027	Free
214	Perri Melvin	pmelvin5x@admin.ch	$2a$04$HdHD9LWRhnnbYSPZwrxJ9.rW/f.XC7Rd3SscNdQ0gO7wrQd4a3Hjm	378-108-2821	Free
215	Mariele Ladley	mladley5y@furl.net	$2a$04$ZNVzAq8S.oLJIS9xwir/Aey8s5rDigy.AZFDzoTLF7QssHuBWOYtS	979-382-3938	Free
216	Cash Betterton	cbetterton5z@delicious.com	$2a$04$djO3CvVqSjX1rTgLo2.3JujLUpKZpBl22yD12QA1.Jyh0wz4ClaU6	511-292-4203	Free
217	Mead Di Claudio	mdi60@creativecommons.org	$2a$04$/jwepbq9ISBtU/x5U5OsWOR57DuTIw7aDoWjZ.MuazLSedBVELCpS	213-585-3432	Paid
218	Lovell Wain	lwain61@stanford.edu	$2a$04$Zt.y7HG8asORXI3wDrHRO.l8WYCmrKVDEfC.Ljpiws7vhcIDVmnIO	151-287-1928	Paid
219	Florinda Molines	fmolines62@unesco.org	$2a$04$EMT8Edixn3rFlDr9K3oA9uExU/Drv0PDUzJWjePVyGKUOwB2WbttS	595-217-7001	Free
220	Bethena Errigo	berrigo63@hatena.ne.jp	$2a$04$BLXEGHPi5njSi.Gk3EPk9.YXnN0gv8ECbjq3taad6/Y7YFKOqUpo2	973-259-3129	Free
221	Cart Manna	cmanna64@miitbeian.gov.cn	$2a$04$p3uQvtcW3qxlIlgYQSkR4.SzBXslyAuSeaIvu89Fdn.EeF9YaJTla	189-393-4826	Free
222	Pepita Vasyutichev	pvasyutichev65@blogtalkradio.com	$2a$04$oX61z/Ill2sHAdL4tKSjeu/Hbdbb7psje3YCTkw/rC53FcXUfppdK	626-274-6258	Free
223	Ibbie Darton	idarton66@netlog.com	$2a$04$L9lV1.J0fJ5JQ8Csu6g5g.C1OnsjHDWevcaCxWgxEp9TaqrjZyWPG	428-572-1291	Paid
224	Carin Atwill	catwill67@wunderground.com	$2a$04$p5S0qEh7JtlxogNIaDDF0.PIYdDQ6y7vBZZcTyjmAETWeKvxsZENK	350-532-6525	Free
225	Orelee Woolager	owoolager68@bandcamp.com	$2a$04$F6/hVeFVypbRAoaE08EYh.TpxeQZoYrCJLxAXQj7BzpC9/sa/tfK.	965-625-6346	Paid
226	Faina Eyam	feyam69@usa.gov	$2a$04$Wug7On7XAXJSlZTXzDxU0e.LL/15G47ckoleFc6eca5HdezibDssW	416-202-1137	Paid
227	Bertrand Orum	borum6a@fema.gov	$2a$04$tPO26qrkoiy6xfqTtzKls.hI5E1ZFUy8SmfW4/OtKPepnxcRKnX3a	135-157-6034	Paid
228	Katinka Oblein	koblein6b@naver.com	$2a$04$lTycc6qGbs63ZGsCXdCcOuCzDkyjcQ1B1KkKT.5nd9j6MHhZ5Fw0u	138-576-7515	Free
229	My Bracey	mbracey6c@bandcamp.com	$2a$04$1nN3c015B3P/6Rh95z/i/eepCOUrIvHv0FKSQ..PexL7NaD9xpJ4C	241-437-2386	Free
230	Louis Maven	lmaven6d@nasa.gov	$2a$04$BVeF9DgsIluyg.QOg7tvMOfehiuA6loAhYZn0QE5qRMeYtaUHaZUm	887-471-0033	Free
231	Mindy Veness	mveness6e@auda.org.au	$2a$04$dAHl4UoAPPKbenAIp9hEHesRz3h95c.510WGGpTf17cri4z.yc9V.	491-615-4217	Paid
232	Lynda Suttie	lsuttie6f@symantec.com	$2a$04$OgWaLE5rh/Rqbtu3vUjnt.lgvGrGcqGIn.4I6X0JPyx3BgTjCynSi	441-688-8953	Paid
233	Malia Hastwell	mhastwell6g@theatlantic.com	$2a$04$7tfuf63jzSvm0xoEI1bae.fykjPoM0IAl/PkDhhFUDkamw9VN57i2	732-257-7162	Paid
234	Eugenius Ainslie	eainslie6h@abc.net.au	$2a$04$2A.3frye313WzPb0VZs5SOXRs57jia1ZR./bG04exjyIaPjdKxnUq	913-421-2849	Paid
235	Allayne Borrington	aborrington6i@msu.edu	$2a$04$bzZi4tQobNfjK2q4hV5y0ud3s4SEilFltkMxbip5nes5x4wXQr6kG	886-214-2680	Free
236	Edin Bateman	ebateman6j@amazonaws.com	$2a$04$l10qJI7e.rdurBqx/Lg02e9acEiQdcImBVosoSdnhfg6pzpTHF4c.	375-350-5150	Free
237	Foss O'Currine	focurrine6k@mapy.cz	$2a$04$Tfi3TaohHqRgJlDF.dHnpuf755qw/yKlKvKS/TdcqNwwaJeA5j2Lu	247-990-0863	Free
238	Ellery Pym	epym6l@cpanel.net	$2a$04$48vnhIdTg3WEsaPbNnMGOumI9Nsur6jeBOiaC9F4gBVXrPDQdxYwu	726-442-5973	Free
239	Kissiah McElhargy	kmcelhargy6m@github.com	$2a$04$x/V3WOGsKl7qHRN8sXfvTuwZUI2fZs0NMDGMvTjSn8vvgfyTVnWoe	302-449-9293	Paid
240	Rutherford Ahrend	rahrend6n@msn.com	$2a$04$sc1zGTjqhBvloPmhmHPWout1jwihI2CFcgwWzNFEdHig2pDzuso9q	953-290-5785	Free
241	Burty Wiffler	bwiffler6o@bluehost.com	$2a$04$pzDUthXasdrafPpbzip3WOnw2WLLZ0DgfcGWG4HyLgBH7CjFTgcZq	732-855-6941	Free
242	Jacquelynn Hudel	jhudel6p@unc.edu	$2a$04$Oox7l4rKH4I3BP0kaXbFbOHk3s.1vGQOWh52ZtdLv8AE7mNVsUfc6	547-921-2210	Free
243	Rora Blanchflower	rblanchflower6q@princeton.edu	$2a$04$m5RiEbk9wjFzs2jh5D7AGunw3IaTTy99VpCVg5P7UGCTbAy4abiXe	943-274-3119	Free
244	Sari Acosta	sacosta6r@diigo.com	$2a$04$o3TAvQh9V2IbPQpivkqRX.jcQJDaSw14HVFKzjXd3uWiM7amUqPSG	858-579-5018	Paid
245	Bertie Crus	bcrus6s@go.com	$2a$04$af2Bwu1/TjR.10HNPydx1erePSk5TdUgGupGn2Elav74LrJvaaRD2	258-807-3816	Free
246	Bettye Peter	bpeter6t@fc2.com	$2a$04$thO065DpUk6tt9/p51won.CaKfdbKBEaqvlyqJwatFpqxegzyJGOi	971-656-5946	Free
247	Stacey Picot	spicot6u@skype.com	$2a$04$K3bq5vmxD3rVN5mLRrrzL.ievh7E5yp7pfOisjommfsQKVJfyzIdm	421-568-7294	Paid
248	Miranda Coneron	mconeron6v@google.co.uk	$2a$04$FgboAvKDUrTWwwlbcCdRjuFFeB5BBt9PESIo0eX5k3GzKHrHkhWbu	298-352-4819	Free
249	Carin Ammer	cammer6w@scribd.com	$2a$04$tww7iKA7D6DvX6HqSDT3uuLJpLp0PThcXpG93umF1KevtR5xjqOGW	644-387-0922	Free
250	Rossie Dufour	rdufour6x@moonfruit.com	$2a$04$j6bcrJlFbSBLKC9SI5rW1.q3/0EBUWeDkBe.P9uErUk93LoVpun9.	536-846-3459	Free
251	Saw Dumbleton	sdumbleton6y@bloglines.com	$2a$04$bfcQPY6eoUOj27t34GLNkOBLB96G9Oc9ele./fxrttOCQNo0UwSMO	428-393-2637	Paid
252	Charmaine Colum	ccolum6z@elegantthemes.com	$2a$04$TyvUhtY9tCEnUgGoNq.hI.DC0AMnKUvXKScfLsn14ACQzQr.xZori	565-967-5170	Paid
253	Llewellyn Mercey	lmercey70@elegantthemes.com	$2a$04$sRLK5UZwG6ZpjTgzLHGJxemdE6GEa3mMOidZulLBx7KRvdgU8qG3C	412-884-3286	Free
254	Dode MacTrustie	dmactrustie71@jugem.jp	$2a$04$jqjtNzWf5i0FSPe7rWsG0.uMzYL57Zkd/nDlJjRbd5iiCCG.MakWq	858-290-6285	Free
255	Karen Pigot	kpigot72@furl.net	$2a$04$3xI3rvfpiWi6u1eYxQWbG.2uSmLOU0jW6T13x8wm1Fi99KVSko99.	224-392-1914	Free
256	Daniel Ivanyushin	divanyushin73@is.gd	$2a$04$SOUjfh.BnLzQWiv7wsV87eb0LuPQjJbVvcYSu06rc8w5U2Ks9NAjq	217-460-7865	Free
257	Rhona Bewshire	rbewshire74@google.fr	$2a$04$YILqi9PK73mHVqWhbHRue.tbJCWjLmIt/a6VwiOu7b.09xYSiq1Iq	938-947-9985	Free
258	Barbi O'Gorman	bogorman75@mashable.com	$2a$04$KfWVrfFB5t2fFo/s3Rjtr.M4Cn3tc/IoFM5RYs7vGaLWOGSfyl9Hi	902-572-6042	Paid
259	Kaile Kynd	kkynd76@earthlink.net	$2a$04$mykbj3WCLgzV.Dgeb6pAWOwFbW.BvYIeRMpnCas6E6S1sfLVp4jWu	919-674-0816	Free
260	Tristam Fairlamb	tfairlamb77@altervista.org	$2a$04$FPjIwmlId28I9XjJbuzfX.Z6a5g1wMaeOckSkaRv4SuhIQE7v2HhK	476-467-6274	Paid
261	Charity MacIllrick	cmacillrick78@earthlink.net	$2a$04$tL.mqt4r6l152vNAoNed8uqo4aufHiUD7x2BJ4Yy8hMA0B8nNy0fC	519-369-5744	Paid
262	Mile Mussalli	mmussalli79@fda.gov	$2a$04$cAUMBABRrtHzjHM2hlGkr.JgwDXI4FGf3Zd0xKnhy58WNUWG5Uy8W	886-691-7639	Free
263	Elden Barnwill	ebarnwill7a@cnbc.com	$2a$04$Frz.5Dp5x/7CftdtWmi5l.HTpDtDANr1PkmO/BkIIKwxEg7h3/hm.	850-441-2198	Free
264	Robin Payley	rpayley7b@miitbeian.gov.cn	$2a$04$1rLKwcoerNIHjnILznjp3uaMY9d3uevVrHP4GwDRbKmZWVOdheDDK	286-480-2007	Paid
265	Augustus Greeding	agreeding7c@istockphoto.com	$2a$04$Ab2JH.swLh42QqWOE0CEQubV5QfLl1ta.loZ9PN551sC.bduzcsfe	762-247-3630	Free
266	Biron Dimmock	bdimmock7d@amazonaws.com	$2a$04$Zb/FBtL2USh2uTIRe38dkeEfDMs0TtHFqre3d/mvgVZFeMCRZLepi	965-503-9465	Paid
267	Nydia Ribbens	nribbens7e@cornell.edu	$2a$04$fJfCpjy8J1y/hNWT/74Em.A8qAbFv01ZfcQtBhFmfxiuuSwTCTFSa	538-362-9930	Paid
268	Ondrea Donoher	odonoher7f@yale.edu	$2a$04$TU5qQksKMwgZqPHFquyY0eJkw6XDNVb5EeOem2.SFDLYE77H/Af6i	390-656-2479	Paid
269	Tallulah Davydoch	tdavydoch7g@smugmug.com	$2a$04$xMaaihcEk/XlVdaW2pIQ4.ZeTjM8kwvbdh1ZKIL4i93.8nJ6P8kQe	763-439-3686	Paid
270	Fabe D'Antoni	fdantoni7h@spiegel.de	$2a$04$l2h9nEeijrN69zqgBH2MJuQjx2lpvCs0c.NUc3.qdtbOHg1OgCvTy	819-253-2318	Paid
271	Allyn Martini	amartini7i@wordpress.com	$2a$04$37mBfAjTstBYIiyPks3qnOgD6sGv325dzGlX/YiXngFhMq4/J0ufW	201-811-0934	Paid
272	Sholom Kinsman	skinsman7j@pbs.org	$2a$04$p2NSvPZse/TEgTdOFYDpEu.Z3Za2L68Hq4RbYwt5Q1epmzmoPhb3C	636-383-1217	Free
273	Gill Mulvy	gmulvy7k@lulu.com	$2a$04$EyaXkIV9x/WnfsAxJpCpQ.K05i7gNPzPNQwati72SDH1FpaXiE0nm	963-635-6286	Paid
274	Peggy Matousek	pmatousek7l@moonfruit.com	$2a$04$5CMNABgB.EhxTNZ9vK2p7OZRhcTkyhanPxH6MrQaz3YtSbRrB4j8y	417-256-7487	Paid
275	Vincent Claessens	vclaessens7m@webs.com	$2a$04$c3U1uHrpkuUp0jyf9Hs.zO.p3ZKDV9MG97hl1G08mlROIAdV7gGSO	517-170-3549	Paid
276	Emelina Huyghe	ehuyghe7n@noaa.gov	$2a$04$Xds36RnFWb0XvDsRzsUCP.PJ2E8p/rFOJTSqGkRIcdGufVrbE6Xse	445-928-5165	Free
277	Vinson Petel	vpetel7o@mozilla.com	$2a$04$jtWG6wxAAEHjt9jtwqF23OBd0NGnJh7ZQ2ldCD7gz0OXfc3a2Fm/C	101-333-7464	Free
278	Prentiss Callam	pcallam7p@un.org	$2a$04$NvpWiLEC2lkNEOp4lTURVe0/hRZFn27olCy3SgBwtiYBbo02i3eV6	512-486-5883	Paid
279	Nananne Bugge	nbugge7q@weather.com	$2a$04$YB2KsoSuBQdl9XAYhkm31e2tQWzcGNtkfFETCfqd6f6Ss5ixhx1cu	956-939-7831	Free
280	Karly Spry	kspry7r@huffingtonpost.com	$2a$04$EbswsQ.nVSAeguFfbG9cHu0acxy6O.nWpTztsSfAmg9Jht53jzXhG	867-606-4651	Paid
281	Adel Fishenden	afishenden7s@pinterest.com	$2a$04$KJ8mh84f.vgUolGWFWP8NeKadObH/pztTh8n2RswOnQGM2Lwne4z6	125-493-4435	Free
282	Park Garton	pgarton7t@prnewswire.com	$2a$04$QFF26YtGJd5Q4Hm55TJtJ.lp4WuKr9FdrAfELv842ss1P0dIh3ele	158-997-4918	Paid
283	Denice Ruston	druston7u@cisco.com	$2a$04$5Mx.dvxZW6b8QkTiENtDkeGmK3EzWwyNjtUcT17ggSKxVGHSbTo1e	433-113-3963	Paid
284	Gard Burkitt	gburkitt7v@tinyurl.com	$2a$04$xjcMtkBp5BvZnBgPX.bNku11pQfjlOy5/l7tSBqLCd.ha9b4o3Z1G	804-955-1420	Free
285	Steve Dory	sdory7w@altervista.org	$2a$04$5AVvIhX/ijEeiywEAEN9huLJ0G8GUjWX5KbozQcFK.LVBY4WPlPhi	842-775-9496	Free
286	Stirling Whitewood	swhitewood7x@cbc.ca	$2a$04$/lsLNBIpjEIo2NbVlc/yw.tvISFXiYYQnkaqI1b4/1o8c3SgpragC	879-162-4003	Paid
287	Fairfax Eallis	feallis7y@google.de	$2a$04$hAoTWPBocebD03V/y7.wm.TE9lCwhogP5/bBVpo6poajcyHyaQHRS	823-170-7796	Free
288	Barney Townson	btownson7z@cafepress.com	$2a$04$xjJfOWPYD/lSiVEYos/bLeT5mnuD8SYjkBEy0Rtqd5JbN6HVxuiKi	599-409-4914	Paid
289	Durante Lowey	dlowey80@alexa.com	$2a$04$Wm3DTC6d0WB.FrMZjKHuKuIw4NbT7GDiTpNnEL.SORhf0G6IVFBNa	594-240-6926	Paid
290	De witt Mattacks	dwitt81@gnu.org	$2a$04$ddI1uQeGzzDys50aLfcRFukhWExBrKIavCuEAzbMCH6fEpKyeVFp.	845-348-8074	Paid
291	Darby Bold	dbold82@eventbrite.com	$2a$04$5S7Dv6Sb.hmg1l6GoqK27OJqTTCFyUYIDQzpWg/9ZnUfefyRRs3by	257-755-9675	Paid
292	Gizela Bransom	gbransom83@noaa.gov	$2a$04$sKRjg3BBSgzkhixz.z7BDO4Anta5tPixu8286pDHUWafrVAL63toS	714-648-6102	Free
293	Hunt Filkov	hfilkov84@homestead.com	$2a$04$Ko0xJAIljSSZr0WE1ujqLOF5DoBp.Q9EeEcxFMYsSe518mm1GRyPS	656-535-4203	Paid
294	Vicky Gynne	vgynne85@nhs.uk	$2a$04$LdrLe.n5bRUXnTNJqm1gaeKTxM/CNtJnLEd9t5lGYETFycJNJYi9y	679-143-0202	Paid
295	Judy Dowd	jdowd86@diigo.com	$2a$04$Zj2ZVAZzHvLN9anuf8uE1.GZQ6.QLLFFtsIYs1JTwuwSJLq9r/Xx2	418-971-4750	Paid
296	Jonie Dienes	jdienes87@reddit.com	$2a$04$dxh7Wkwb05EwEpi47BIhP.nK5YZtwtIuwJI9H7B0phQtHhXWdvCYG	964-828-6128	Paid
297	Friedrick Vasyukov	fvasyukov88@gravatar.com	$2a$04$aKGDErLh3ZHrTzDzT5wN9e0GJm/w3jnVbVGXYHuZJLZ12wm9Yjevi	726-293-8591	Free
298	Ekaterina Crohan	ecrohan89@nsw.gov.au	$2a$04$oAubEclaH.ZzsB8uQTU55OapTiuKo0yXOv1kX73ObUMUFMWn1uqAi	979-864-4050	Free
299	Seana Nance	snance8a@fc2.com	$2a$04$7N/IeYvoRTjW2OXSrHyx9ebleKSJ6GogUqsOaO577eLSYOQTibYL.	716-707-3151	Free
300	Caren Landman	clandman8b@biblegateway.com	$2a$04$GoD8lALgVkw95OMjUVdVmusW62UFVVEV6G08U3lmKXJTTulTaGguW	167-136-6086	Free
200	Constanta Aulsford	caulsford5j@berkeley.edu	$2a$04$Us0dCmooF1pVEct2iZmi4uwVQcNl4sixdS8uli2QstB/c1.QRKqz6	452-779-0979	paid
301	alice	alice@example.com	$2b$12$1pX8pYWvz4b3rW/20P/OW.IAgcpfVRfF4EufY8l6J/HoWmEyvBM52	555-1234	Free
302	Srija Ramisetty	sramise2@asu.edu	$2b$12$8mJleSbF/alEX1nm3WnhzePIiuMCPNt9KfKFblnuZ84KHcUsHcVQe	1234567890	Free
303	Nithin Abburi	nabburi@asu.edu	$2b$12$xP6HR8P.kONUG8XxKM92nuXyjkcMH7nX3z4hse3.bJoM4PTCPfdvy	1122334455	Free
304	tyui	tyui@qwe.com	$2b$12$Dz.HEiQ4emf8F8m9XcYM3uhhuvCAn7Mpr/zwpGstsexbGSTg0yZg2	1234564321	Free
306	ty	ty@qw.com	$2b$12$eph2gm.8aRf93Dmwenvoo.R/WTBu3w8pOTafZls0KVVIqLtKuQrBi	1234567899	Free
307	hi	hibye@gmail.com	$2b$12$WoS6PAMDWNoBhwuS2kcp1esm9JYIzIXoZp8gfDyAXfrx6PWUfB9xu	1231231231	Free
308	tyuopi	type@gmail.com	$2b$12$UDJI5H8KCCMITBR/s7LxRucrV6SBGBYR1e249Mh109J9/oMJaB1oq	1234123412	Free
309	ttt	ttt@gmail.com	$2b$12$xAXeAQIPbZE0emCVnsA7ceAMH4HsPoDoLZ6GyoVCMK2fe8Rd8m8XS	1234543211	Free
310	yyy	yyy@gmail.com	$2b$12$Yultff3hFFSBxNcR.id9duDTrvV.cB2Jk4l0XdvKE9pQArW/GPUN.	12321112	Free
311	hy	hyt@gmail.com	$2b$12$BUOihzaZYo5OpxsLywoKz.xVhDKVAbMbPzHTOcvQSCX/AYzW9d366	1231234566	Free
313	erty	qwerttyui@gmail.com	$2b$12$HpmaOIfa6FaJ1f3N.Jku5OgjLiA8NcO/8xkP9d.zruYJtLQJgrEqK	12345678909	Free
314	qw	qw@gmail.com	$2b$12$/kIa57liqFk7fAdjOMSKxO1m6tkmTWf9TqNxdWXeTG4RbpiDgAGLW	1111111222222	Free
315	qwy	qwy@gmail.com	$2b$12$68IElV4.oZdj83/TetL2lunQoyAfZtYx2uvKsbcAiIpEY0qHfXJeK	11111511222222	Free
316	ty6ui	ty6ui@gmail.com	$2b$12$l/dmKp9OeqIPnc9kHlogLO5yQabqr/7NJAm0VaHKfQrwswLIPhH1S	98765541234	Free
317	bob	bob@gmail.com	$2b$12$svrlZCvS6FQ88uJInUK3netfRgqBO3TiL1utjn4z0YiVLjB5NfC7G	9876543210	Free
318	lilly	lilly@gmail.com	$2b$12$VaxAzzo7Syvs.LgR1Itx1urNGBEYGUR9xePkxn5MFyYzbK4kvSvZO	565678980	Free
319	edc	edc@gmail.com	$2b$12$M7wLtEkmrxQN6vWF0LPvMOGNGcVw55aKmHFzUfuejyU2chXjhms32	11133355565	Free
\.


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 225
-- Name: scam_reports_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scam_reports_rid_seq', 508, true);


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_uid_seq', 319, true);


--
-- TOC entry 3486 (class 2606 OID 16573)
-- Name: scam_authorities scam_authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_authorities
    ADD CONSTRAINT scam_authorities_pkey PRIMARY KEY (org_id);


--
-- TOC entry 3492 (class 2606 OID 16598)
-- Name: scam_report_sources scam_report_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_report_sources
    ADD CONSTRAINT scam_report_sources_pkey PRIMARY KEY (sid, rid);


--
-- TOC entry 3488 (class 2606 OID 16578)
-- Name: scam_reports scam_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_reports
    ADD CONSTRAINT scam_reports_pkey PRIMARY KEY (rid);


--
-- TOC entry 3490 (class 2606 OID 16593)
-- Name: scam_sources scam_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_sources
    ADD CONSTRAINT scam_sources_pkey PRIMARY KEY (sid);


--
-- TOC entry 3484 (class 2606 OID 16568)
-- Name: scam_types scam_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_types
    ADD CONSTRAINT scam_types_pkey PRIMARY KEY (tid);


--
-- TOC entry 3478 (class 2606 OID 16559)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- TOC entry 3480 (class 2606 OID 16561)
-- Name: users users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_email_key UNIQUE (user_email);


--
-- TOC entry 3482 (class 2606 OID 16563)
-- Name: users users_user_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_phone_key UNIQUE (user_phone);


--
-- TOC entry 3497 (class 2606 OID 16612)
-- Name: scam_prevention_tips scam_prevention_tips_tid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_prevention_tips
    ADD CONSTRAINT scam_prevention_tips_tid_fkey FOREIGN KEY (tid) REFERENCES public.scam_types(tid) ON DELETE CASCADE;


--
-- TOC entry 3495 (class 2606 OID 16604)
-- Name: scam_report_sources scam_report_sources_rid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_report_sources
    ADD CONSTRAINT scam_report_sources_rid_fkey FOREIGN KEY (rid) REFERENCES public.scam_reports(rid) ON DELETE CASCADE;


--
-- TOC entry 3496 (class 2606 OID 16599)
-- Name: scam_report_sources scam_report_sources_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_report_sources
    ADD CONSTRAINT scam_report_sources_sid_fkey FOREIGN KEY (sid) REFERENCES public.scam_sources(sid) ON DELETE CASCADE;


--
-- TOC entry 3493 (class 2606 OID 16584)
-- Name: scam_reports scam_reports_tid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_reports
    ADD CONSTRAINT scam_reports_tid_fkey FOREIGN KEY (tid) REFERENCES public.scam_types(tid) ON DELETE CASCADE;


--
-- TOC entry 3494 (class 2606 OID 16579)
-- Name: scam_reports scam_reports_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scam_reports
    ADD CONSTRAINT scam_reports_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid) ON DELETE CASCADE;


-- Completed on 2025-05-02 17:44:51 MST

--
-- PostgreSQL database dump complete
--

