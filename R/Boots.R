# Databricks notebook source
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# COMMAND ----------

df1 = pd.read_csv("/FileStore/tables/GHCND_sample_csv.csv")

# COMMAND ----------

df1 = pd.read_csv("/dbfs/FileStore/shared_uploads/1394762071.SMALL.MAT/NGA_Training_Dataset.csv")

# COMMAND ----------

import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output

app = dash.Dash(__name__)

app.layout = html.Div([
    html.H6("Change the value in the text box to see callbacks in action!"),
    html.Div([
        "Input: ",
        dcc.Input(id='my-input', value='initial value', type='text')
    ]),
    html.Br(),
    html.Div(id='my-output'),

])


@app.callback(
    Output(component_id='my-output', component_property='children'),
    Input(component_id='my-input', component_property='value')
)
def update_output_div(input_value):
    return 'Output: {}'.format(input_value)


if True:
    app.run_server(debug=True)


# COMMAND ----------

import plotly.express as px

px.set_mapbox_access_token('my_personal_token')

fig = px.scatter_mapbox(arpt_rwy_df.sort_values('LENGTH',
                        ascending=True)[['NAME','LENGTH','WGS_DLAT','WGS_DLONG']],
                        hover_name='NAME', lat="WGS_DLAT", lon="WGS_DLONG", color="LENGTH",
                        color_continuous_scale=px.colors.sequential.Rainbow, size_max=30, zoom=2, 
                        height=600)
fig.show()

# COMMAND ----------

df1.sub_event_type.unique()

# COMMAND ----------

df1.info()

# COMMAND ----------

type('hello')

# COMMAND ----------

