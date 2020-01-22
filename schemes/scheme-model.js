const db = require("../data/dbConfig");

async function find(query = {}) {
  const { limit = 10, sortby = "id", sortdir = "asc" } = query;

  let rows = await db("schemes")
    .orderBy(sortby, sortdir)
    .limit(limit);

  return rows;
}

function findById(id) {
  return db
    .select("*")
    .from("schemes")
    .where({ id })
    .first();
}

function findSteps(schemeId) {
  return db("steps")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .join("schemes", "schemes.id", "steps.scheme_id")
    .where("scheme_id", schemeId);
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
    .then(ids => {
      const [id] = ids;
      return findById(id);
    });
}

function update(scheme_name, id) {
  return db("schemes")
    .where({ id })
    .update(scheme_name);
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}

function addStep(step, schemeId) {
  return db("schemes").insert(step, "id");
}

module.exports = { find, findById, findSteps, add, update, remove, addStep };
