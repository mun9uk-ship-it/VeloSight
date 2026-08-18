# 🚀 VeloSight — Universal Interactive Data Explorer

[![R](https://img.shields.io/badge/R-4.4.0-blue?logo=r)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1.8.0-brightgreen?logo=r)](https://shiny.rstudio.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red)](https://github.com/mun9uk-ship-it/VeloSight)
[![Live Demo](https://img.shields.io/badge/Live-Demo-blue?logo=posit)](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22003723.svg)](https://doi.org/10.5281/zenodo.22003723)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0004--4217--1526-green?logo=orcid)](https://orcid.org/0009-0004-4217-1526)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/muneer-ahmed-it-cloud-ai-support)

> **Upload, explore, and visualize any dataset instantly — no coding required.**  
> *Built with R Shiny for researchers, analysts, and data enthusiasts.*

---

## 🔭 What is VeloSight?

**VeloSight** is an interactive web application that turns raw CSV files into actionable insights. It empowers you to:

- 📤 **Upload** any CSV file or instantly explore the built-in demo dataset (`mtcars`).
- 🔍 **Inspect** data quality with a detailed, per-column report.
- 🧹 **Clean** missing values with one click (remove rows or impute with mean/mode).
- 🎚️ **Filter** data dynamically using intuitive sliders and checkboxes.
- 📊 **Visualize** relationships with an interactive, hover-enabled scatter plot.
- 📋 **Export** the cleaned or original dataset with a single click.

> Perfect for data analysts, students, and professionals who want to understand their data quickly and without writing code.

---

## ✨ Key Features

- 📂 **Instant Upload & Demo** — Upload a CSV file or start exploring the built-in `mtcars` dataset immediately.
- 🧹 **Smart Cleaning** — Handle missing values by removing rows or imputing numeric (mean) and text (mode) values.
- 🎚️ **Dynamic Filtering** — Filter your data using sliders for numbers and checkboxes for categories.
- 📊 **Interactive Plot** — Create a fully interactive scatter plot. Hover over points for details, and color by any category column.
- 📋 **Data Table** — View, search, and paginate through your filtered data.
- 🔍 **Quality Report** — Get a comprehensive report on column types, missing values, unique counts, and duplicate rows.
- 📥 **Export** — Download the original or the cleaned/filtered dataset as a CSV file.

---

## 🖥️ How to Use VeloSight

### 🔗 Try the Live Demo

👉 **[Live VeloSight Demo](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)**

Once there, you can:

1. **Explore the Demo** — The app loads with the `mtcars` dataset. Play with the filters, charts, and tabs to see how it works.
2. **Upload Your Own File** — Click the **"Upload CSV File"** button in the sidebar. The app will instantly switch to your data.
3. **Clean Your Data** — Use the **"Data Cleaning"** options to handle missing values:
   - *Keep as is*: Do nothing.
   - *Remove rows with missing values*: Delete any row containing an `NA`.
   - *Fill numeric = mean, text = mode*: Impute missing values automatically.
4. **Apply Filters** — Use the **"Dynamic Filters"** section to:
   - Drag sliders to filter numeric columns (e.g., show only rows where `mpg` is between 15 and 25).
   - Tick checkboxes to filter categorical columns (e.g., show only rows where `cyl` is 4 or 6).
5. **Visualize** — Go to the **"Dashboard"** tab:
   - Select **X Axis**, **Y Axis**, and **Color By** columns from the dropdowns.
   - Hover over points on the interactive plot to see details.
   - Scroll through the **Data Table** below the plot.
6. **Explore Quality** — Switch to the **"Data Quality Report"** tab to see:
   - Column types, missing counts, and unique values.
   - Number of duplicate rows.
   - Summary statistics (mean, median, min, max, etc.).
7. **Export** — Use the **"Download Original File"** button in the sidebar to save the untouched dataset, or copy data directly from the table.

### 💻 Run Locally (for Developers)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mun9uk-ship-it/VeloSight.git
   cd VeloSight
   ```

2. **Install required packages in R:**
   ```r
   install.packages(c("shiny", "bslib", "ggplot2", "plotly", "DT", "bsicons"))
   ```

3. **Run the app:**
   ```r
   shiny::runApp("app.R")
   ```

---

## 🌐 What Can You Use VeloSight For?

VeloSight is a versatile tool for any scenario where you need to quickly understand a dataset:

- **🧪 Research & Academia** — Exploratory data analysis for student projects or research papers.
- **📊 Business Analytics** — Upload sales, customer, or operational data to spot trends and outliers.
- **📈 Data Journalism** — Quickly explore public datasets to find interesting stories.
- **🎓 Teaching & Learning** — Demonstrate data cleaning, filtering, and visualization concepts in the classroom.
- **🔍 Personal Projects** — Analyze your own data (e.g., fitness logs, budget tracking) without writing a single line of code.
- **💼 Client Presentations** — Use the interactive dashboard to walk stakeholders through data insights during meetings.

---

## 💡 Suggested Improvements

- **⚡ Performance** — For very large CSV files (> 50 MB), consider adding a "Row Limit" option (e.g., load first 10,000 rows) to prevent browser crashes.
- **📊 More Plot Types** — Add options for **bar charts**, **histograms**, and **boxplots** in addition to scatter plots.
- **🔗 Advanced Filtering** — Allow **text search** filters (e.g., "contains 'Smith'") for high-cardinality text columns.
- **📁 Multiple File Support** — Enable uploading **Excel (.xlsx)** and **JSON** files in addition to CSV.
- **💾 Save Filter State** — Add a "Bookmark" or "Save State" feature to share a specific filtered view via URL.
- **🎨 Customizable Themes** — Allow users to switch between light/dark themes.
- **📤 Export Filtered Data** — Add a dedicated "Download Filtered Data" button to save the currently filtered dataset.

---

## 📊 Technology Stack

- **Frontend** — R Shiny, `bslib` (Bootstrap 5)
- **Backend** — R
- **Data Manipulation** — Base R
- **Visualization** — `ggplot2`, `plotly`
- **Data Table** — `DT` (DataTables)
- **Icons** — `bsicons`
- **Deployment** — Posit Connect, shinyapps.io

---

## 📄 License

This project is open-source and available under the **MIT License**.

---

## 🙏 Acknowledgements

- Built with ❤️ using the [R](https://www.r-project.org/) ecosystem and [Shiny](https://shiny.rstudio.com/).
- Interactive visualizations powered by [Plotly](https://plotly.com/r/).

---

## 📧 Contact & Connect

- **Author:** Muneer Ahmed
- **GitHub:** [mun9uk-ship-it](https://github.com/mun9uk-ship-it)
- **Email:** [mun9uk@gmail.com](mailto:mun9uk@gmail.com)
- **ORCID:** [0009-0004-4217-1526](https://orcid.org/0009-0004-4217-1526)
- **LinkedIn:** [Muneer Ahmed](https://www.linkedin.com/in/muneer-ahmed-it-cloud-ai-support)
- **DOI:** [10.5281/zenodo.22003723](https://doi.org/10.5281/zenodo.22003723)

---

**🚀 Explore, understand, and share insights — VeloSight makes it effortless.**

---

---

# 🚀 "فيلوسايت" — المستكشف التفاعلي الشامل للبيانات

[![R](https://img.shields.io/badge/R-4.4.0-blue?logo=r)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1.8.0-brightgreen?logo=r)](https://shiny.rstudio.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red)](https://github.com/mun9uk-ship-it/VeloSight)
[![Live Demo](https://img.shields.io/badge/Live-Demo-blue?logo=posit)](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22003723.svg)](https://doi.org/10.5281/zenodo.22003723)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0004--4217--1526-green?logo=orcid)](https://orcid.org/0009-0004-4217-1526)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/muneer-ahmed-it-cloud-ai-support)

> **"أبلود"، استكشف، وصوّر أي مجموعة بيانات فوراً — دون الحاجة إلى كتابة أي "كود".**  
> *مُطوّر باستخدام "آر شايني" للباحثين والمحللين وعشاق البيانات.*

---

## 🔭 ما هو "فيلوسايت"؟

**"فيلوسايت"** هو تطبيق ويب تفاعلي يحوّل ملفات "سي إس في" الخام إلى رؤى قابلة للتنفيذ. يمكّنك من:

- 📤 **"أبلود"** أي ملف "سي إس في" أو استكشاف مجموعة البيانات التجريبية المدمجة (`mtcars`) فوراً.
- 🔍 **"إنسبكت"** جودة البيانات من خلال تقرير مفصّل لكل عمود.
- 🧹 **"كلين"** القيم المفقودة بنقرة واحدة (حذف الصفوف أو تعبئتها بالمتوسط/المنوال).
- 🎚️ **"فيلتر"** البيانات ديناميكياً باستخدام أشرطة تمرير ومربعات اختيار بديهية.
- 📊 **"فيجوالايز"** العلاقات من خلال "مخطط مبعثر" تفاعلي مع خاصية التمرير.
- 📋 **"إكسبورت"** مجموعة البيانات الأصلية أو المنظفة بضغطة زر.

> مثالي لمحللي البيانات والطلاب والمحترفين الذين يرغبون في فهم بياناتهم بسرعة وبدون كتابة "كود".

---

## ✨ "الميزات" الرئيسية

- 📂 **"أبلود" فوري وعينة تجريبية** — حمّل ملف "سي إس في" أو ابدأ فوراً باستكشاف بيانات `mtcars` المدمجة.
- 🧹 **"كلين" ذكي** — تعامل مع القيم المفقودة بحذف الصفوف أو بتعبئة القيم العددية (بالمتوسط) والنصية (بالمنوال).
- 🎚️ **"فيلتر" ديناميكية** — صفّف بياناتك باستخدام أشرطة تمرير للأعداد ومربعات اختيار للفئات.
- 📊 **"مخطط" تفاعلي** — أنشئ "مخطط مبعثر" تفاعلياً بالكامل. مرّر فوق النقاط للاطلاع على التفاصيل، ولوّن حسب أي عمود فئوي.
- 📋 **"تيبل" بيانات** — اعرض، ابحث، وصفح خلال بياناتك المُصفاة.
- 🔍 **"ريبورت" الجودة** — احصل على تقرير شامل بأنواع الأعمدة، والقيم المفقودة، والقيم الفريدة، والصفوف المكررة.
- 📥 **"إكسبورت"** — حمّل مجموعة البيانات الأصلية أو المنظفة/المُصفاة كملف "سي إس في".

---

## 🖥️ كيفية استخدام "فيلوسايت"

### 🔗 جرب "الديمو" الحي

👉 **[العرض الحي لفيلوسايت](https://01a011ac-1b85-453e-2fc7-be234bc8489a.share.connect.posit.cloud/)**

بمجرد وصولك إلى هناك، يمكنك:

1. **استكشاف "الديمو"** — يُحمّل التطبيق مع مجموعة بيانات `mtcars`. جرب "الفلاتر" والرسوم البيانية و"التابز" لترى كيف يعمل.
2. **"أبلود" ملفك الخاص** — انقر على زر **"أبلود" ملف سي إس في** في الشريط الجانبي. سيتحول التطبيق فوراً إلى بياناتك.
3. **"كلين" بياناتك** — استخدم خيارات **"كلين" البيانات** للتعامل مع القيم المفقودة:
   - *الإبقاء كما هي*: لا تفعل شيئاً.
   - *حذف الصفوف التي تحتوي على قيم مفقودة*: حذف أي صف يحتوي على `NA`.
   - *تعبئة القيم العددية بالمتوسط والنصية بالمنوال*: تعبئة القيم المفقودة تلقائياً.
4. **تطبيق "الفلاتر"** — استخدم قسم **"الفلاتر" الديناميكية** من أجل:
   - سحب أشرطة التمرير لتصفية الأعمدة الرقمية (مثال: عرض الصفوف التي يكون فيها `mpg` بين 15 و 25 فقط).
   - تحديد مربعات الاختيار لتصفية الأعمدة الفئوية (مثال: عرض الصفوف التي يكون فيها `cyl` يساوي 4 أو 6 فقط).
5. **التصوّر** — انتقل إلى "التاب" **"لوحة التحكم"**:
   - اختر أعمدة **"المحور السيني"** و **"المحور الصادي"** و **"التلوين حسب"** من القوائم المنسدلة.
   - مرّر فوق النقاط على "المخطط التفاعلي" لرؤية التفاصيل.
   - تصفّح **"تيبل" البيانات** أسفل المخطط.
6. **استكشاف الجودة** — انتقل إلى "التاب" **"ريبورت" جودة البيانات** لترى:
   - أنواع الأعمدة، وعدد القيم المفقودة، والقيم الفريدة.
   - عدد الصفوف المكررة.
   - إحصائيات موجزة (المتوسط، الوسيط، القيم الدنيا والعليا، إلخ).
7. **"الإكسبورت"** — استخدم زر **"أبلود" الملف الأصلي** في الشريط الجانبي لحفظ مجموعة البيانات غير المعدلة، أو انسخ البيانات مباشرة من "التيبل".

### 💻 التشغيل المحلي (للمطورين)

1. **"كلون" المستودع:**
   ```bash
   git clone https://github.com/mun9uk-ship-it/VeloSight.git
   cd VeloSight
   ```

2. **تثبيت "الباكدجز" المطلوبة في "آر":**
   ```r
   install.packages(c("shiny", "bslib", "ggplot2", "plotly", "DT", "bsicons"))
   ```

3. **تشغيل "الأب":**
   ```r
   shiny::runApp("app.R")
   ```

---

## 🌐 فيم يمكنك استخدام "فيلوسايت"؟

"فيلوسايت" أداة متعددة الاستخدامات لأي سيناريو تحتاج فيه إلى فهم مجموعة بيانات بسرعة:

- **🧪 "ريسرتش" الأكاديمي** — تحليل البيانات الاستكشافي لمشاريع الطلاب أو الأوراق البحثية.
- **📊 "بيزنس" أناليتكس** — تحميل بيانات المبيعات أو العملاء أو العمليات لاكتشاف "الاتجاهات" و"القيم المتطرفة".
- **📈 "داتا" جورناليزم** — استكشاف سريع لمجموعات البيانات العامة للعثور على قصص مثيرة للاهتمام.
- **🎓 "إديوكيشن" والتعلم** — شرح مفاهيم "كلين" البيانات وتصفيتها وتصورها في الفصول الدراسية.
- **🔍 مشاريع شخصية** — تحليل بياناتك الخاصة (مثل سجلات اللياقة البدنية، تتبع الميزانية) دون كتابة سطر واحد من "الكود".
- **💼 عروض العملاء** — استخدام لوحة التحكم التفاعلية لعرض رؤى البيانات على أصحاب المصلحة أثناء الاجتماعات.

---

## 💡 "تحسينات" مقترحة

- **⚡ "الأداء"** — لملفات "سي إس في" الكبيرة جداً (> 50 ميجابايت)، فكر في إضافة خيار "حد الصفوف" (مثل تحميل أول 10000 صف فقط) لمنع تعطل "المتصفح".
- **📊 أنواع "مخططات" إضافية** — أضف خيارات **"المخططات العمودية"** و **"المدرجات التكرارية"** و **"المخططات الصندوقية"** بالإضافة إلى "المخطط المبعثر".
- **🔗 "فيلتر" متقدمة** — سمح بـ **"البحث النصي"** (مثال: "يحتوي على 'سميث'") للأعمدة النصية عالية التنوع.
- **📁 دعم أنواع "فايلز" متعددة** — أضف إمكانية تحميل ملفات **"إكسل" (xlsx.)** و **"جيسون" (JSON)** بالإضافة إلى "سي إس في".
- **💾 حفظ "حالة" الفلتر** — أضف ميزة "إشارة مرجعية" أو "حفظ الحالة" لمشاركة عرض مُصفى معين عبر "رابط".
- **🎨 "سمات" قابلة للتخصيص** — سمح للمستخدمين بالتبديل بين "السمات" الفاتحة والداكنة.
- **📤 "إكسبورت" البيانات المُصفاة** — أضف زراً مخصصاً **"أبلود" البيانات المُصفاة** لحفظ مجموعة البيانات المُصفاة حالياً.

---

## 📊 "ستاك" التقنيات المستخدمة

- **"الواجهة" الأمامية** — "آر شايني"، `bslib` ("بوستراب 5")
- **"الواجهة" الخلفية** — "آر"
- **معالجة البيانات** — "آر" الأساسية
- **"التصوّر"** — `ggplot2`، `plotly`
- **"تيبل" البيانات** — `DT` ("داتا تيبلز")
- **"الأيقونات"** — `bsicons`
- **"النشر"** — "بوزيت كونكت"، "شايني أبس.آي أو"

---

## 📄 "الترخيص"

هذا المشروع مفتوح المصدر ومتاح بموجب **"رخصة إم آي تي"**.

---

## 🙏 "الشكر والتقدير"

- مُطوّر بحب ❤️ باستخدام نظام "آر" البيئي و [Shiny](https://shiny.rstudio.com/).
- "التصورات" التفاعلية مدعومة من [Plotly](https://plotly.com/r/).

---

## 📧 "التواصل"

- **"المؤلف":** منير أحمد
- **"جيت هاب":** [mun9uk-ship-it](https://github.com/mun9uk-ship-it)
- **"البريد الإلكتروني":** [mun9uk@gmail.com](mailto:mun9uk@gmail.com)
- **"أورسيد":** [0009-0004-4217-1526](https://orcid.org/0009-0004-4217-1526)
- **"لينكد إن":** [Muneer Ahmed](https://www.linkedin.com/in/muneer-ahmed-it-cloud-ai-support)
- **"دي أو آي":** [10.5281/zenodo.22003723](https://doi.org/10.5281/zenodo.22003723)

---

**🚀 استكشف، افهم، وشارك "الرؤى" — "فيلوسايت" يجعله أمراً سهلاً.**
